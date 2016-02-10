class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10).includes(:activities)
  end

  def show

  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render :new
    end
  end

  def update
    if @pin.update(pin_params)
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
      @pin = Pin.find_by(id: params[:pin_id] || params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :image, :tag_list)
    end
end
