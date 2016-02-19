class PinsController < ApplicationController
  include BreadcrumbsHelper
  include PinsHelper

  before_action :set_pin, only: [:show, :edit, :update, :destroy, :like, :unlike, :add_attachment]
  before_action :authenticate_user!, except: [:index, :show], unless: :admin_logged_in?
  before_action :correct_user, only: [:edit, :update, :destroy], unless: :admin_logged_in?

  crumb(only: [:show, :new, :edit, :create, :update]) do
    ["Projects", pins_path]
  end

  crumb(only: [:edit, :create, :update]) do
    [@pin.title, pin_path(@pin)]
  end

  def index
    @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 30).includes(:activities)
  end

  def show
    add_crumb(@pin.title, pin_path(@pin))
  end

  def new
    add_crumb("New", pins_path)
    @pin = current_user.pins.build
  end

  def edit
    add_crumb("Edit", pins_path)
  end

  def create
    add_crumb("New", pins_path)

    @pin = current_user.pins.build(pin_params)
    if @pin.save
      save_attachments!
      redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render :new
    end
  end

  def update
    add_crumb("Edit", pins_path)

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

end
