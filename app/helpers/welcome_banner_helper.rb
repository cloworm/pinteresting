module WelcomeBannerHelper

  def render_welcome_banner?
    defined?(@welcome) && @welcome == true
  end

  def include_welcome_banner_in_layout!
    @welcome = true
  end

end
