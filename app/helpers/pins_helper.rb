module PinsHelper

  def render_pin_card(pin, options = {})
    options[:pin] = pin
    options[:image_size] ||= :medium
    render 'pins/pin_card', options
  end

  def render_new_pin_card
    render 'pins/new_pin_card'
  end

end
