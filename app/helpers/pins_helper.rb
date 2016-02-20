module PinsHelper
  def admin_logged_in?
    user_signed_in? && current_user.admin?
  end

  def render_pin_card(pin, options = {})
    options[:pin] = pin
    options[:image_size] ||= :medium
    render 'pins/pin_card', options
  end

  def render_new_pin_card
    render 'pins/new_pin_card'
  end
end
