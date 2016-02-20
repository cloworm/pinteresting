class UsersController < ApplicationController
  include PinFilters

  def show
    @user = User.find(params[:id])
    @pins = @user.pins.all.paginate(:page => params[:page], :per_page => 10).includes(:activities)
    @pins = apply_pin_filters(@pins)
  end
end
