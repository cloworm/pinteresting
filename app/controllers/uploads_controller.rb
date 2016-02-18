class UploadsController < ApplicationController
  include PinsHelper
  before_action :set_pin, only: [:destroy]
  before_action :set_upload, only: [:destroy]
  before_action :correct_user, only: [:destroy], unless: :admin_logged_in?

  def destroy
    @upload.destroy
    redirect_to pin_url(@pin), notice: 'Attachment was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find_by(id: params[:pin_id])
    end

    def set_upload
      @upload = @pin.uploads.find_by(id: params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:pin_id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end

end
