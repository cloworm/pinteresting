class ActivitiesController < ApplicationController

  def create
    @activity = pin.activities.build(activity_params)
    if @activity.save
      redirect_to pin, notice: 'Comment was successfully posted.'
    else
      flash[:alert] = 'You have to type something before clicking submit.'
      render :template => "pins/show"
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      p = params.require(:activity).permit(:body, :type)
      p[:user_id] = current_user.id
      p
    end

    def pin
      @pin ||= Pin.find_by(id: params[:pin_id])
    end
end
