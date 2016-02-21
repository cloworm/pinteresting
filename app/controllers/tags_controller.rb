class TagsController < ApplicationController
  include WelcomeBannerHelper
  include BreadcrumbsHelper
  include PinFilters

  before_action :set_tag, only: [:show]
  before_action :include_welcome_banner_in_layout!, only: [:show], unless: :user_signed_in?

  crumb(only: [:show]) do
    ["Projects", pins_path]
  end

  crumb(only: [:show]) do
    [@tag.name, tag_path(@tag.name)]
  end

  crumb(only: [:show]) do
    view_context.sort_by_link
  end

  def show
    @pins = Pin.tagged_with(@tag.name).all.paginate(:page => params[:page], :per_page => 30).includes(:activities)
    @pins = apply_pin_filters(@pins)
  end

  private

    def set_tag
      @tag = ActsAsTaggableOn::Tag.find_by_name(params[:id])
    end

end
