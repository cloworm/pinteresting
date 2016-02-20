class PinsController < ApplicationController
  include BreadcrumbsHelper
  include PinsHelper

  before_action :set_pin, only: [:show, :edit, :update, :destroy, :like, :unlike, :add_attachment]
  before_action :authenticate_user!, except: [:index, :show], unless: :admin_logged_in?
  before_action :correct_user, only: [:edit, :update, :destroy], unless: :admin_logged_in?

  crumb(only: [:search, :show, :new, :edit, :create, :update]) do
    ["Projects", pins_path]
  end

  crumb(only: [:show, :edit, :update]) do
    [@pin.title, pin_path(@pin)]
  end

  crumb(only: [:search]) do
    ["\"#{params[:search]}\"", request.fullpath]
  end

  crumb(only: [:index, :search]) do
    if sort_by_most_liked?
      most_recent = view_context.link_to "Most Recent", pins_path(:filter => { :sort_by => "most_recent" })
      most_liked = view_context.link_to "Most Liked", pins_path(:filter => { :sort_by => "most_liked" }), class: "current-sorting"
    else
      most_recent = view_context.link_to "Most Recent", pins_path(:filter => { :sort_by => "most_recent" }), class: "current-sorting"
      most_liked = view_context.link_to "Most Liked", pins_path(:filter => { :sort_by => "most_liked" })
    end
    view_context.raw("Sort by: #{most_recent} | #{most_liked}")
  end

  def index
    @pins = Pin.all.paginate(:page => params[:page], :per_page => 30).includes(:activities)

    if sort_by_most_liked?
      subquery = Pin
        .select("pins.id as pin_id, count(pins.id) as likes_count")
        .joins("INNER JOIN activities ON activities.pin_id = pins.id AND activities.type = 'like'")
        .group("pins.id")
        .order("likes_count DESC")

      @pins = @pins
        .joins("LEFT OUTER JOIN (#{subquery.to_sql}) as subquery ON pins.id = subquery.pin_id")
        .order("COALESCE(subquery.likes_count, 0) DESC")
    else
      @pins = @pins.order("created_at DESC")
    end
  end

  def search
    conditions = %w[pins.title pins.description tags.name users.name]
    conditions.map! { |column| "UPPER(#{column}) LIKE UPPER(?)" }
    values = conditions.map { "%#{params[:search]}%" }

    @pins = Pin.all.uniq
      .order("pins.created_at DESC")
      .paginate(:page => params[:page], :per_page => 30)
      .includes(:activities)
      .eager_load(:user, :tags)
      .where(conditions.join(" OR "), *values)
  end

  def show
  end

  def new
    crumb("New", pins_path)
    @pin = current_user.pins.build
  end

  def edit
    crumb("Edit", pins_path)
  end

  def create
    crumb("New", pins_path)

    @pin = current_user.pins.build(pin_params)
    if @pin.save
      save_attachments!
      redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render :new
    end
  end

  def update
    crumb("Edit", pins_path)

    if @pin.update(pin_params)
      save_attachments!
      redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  def like
    unless current_user.likes_pin?(@pin)
      @activity = @pin.activities.build(
        :user_id => current_user.id,
        :type => "like"
      )

      @activity.save
    end

    respond_to do |format|
      format.js
    end

    # TODO: handle errors.
    # if @activity.save
    #   render json: @activity, status: :created
    # else
    #   render json: @activity.errors, status: :unprocessable_entity
    # end
  end

  def unlike
    @pin.activities.where(
      :user_id => current_user.id,
      :type => "like"
    ).delete_all

    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.includes(:tags, :uploads => [:user]).find_by(id: params[:pin_id] || params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:title, :description, :image, tag_list: []).tap do |params|
        params[:tag_list] &&= params[:tag_list].join(", ")
      end
    end

    def save_attachments!
      # TODO: prevent other users from uploading.
      return unless params[:attachments]
      params[:attachments].each do |attachment|
        @pin.uploads.create(:attachment => attachment, :user => current_user)
      end
    end

    def filter_params
      @filter_params ||= begin
        p = if params[:filter]
              params.require(:filter).permit(:sort_by)
            else
              {}
            end
        p[:sort_by] ||= "most_recent"
        p
      end
    end

    def sort_by_most_liked?
      filter_params[:sort_by] == "most_liked"
    end

end
