class TagsController < ApplicationController
  include BreadcrumbsHelper

  before_action :set_tag, only: [:show]

  crumb(only: [:show]) do
    ["Projects", pins_path]
  end

  crumb(only: [:show]) do
    [@tag.name, tag_path(@tag.name)]
  end

  def show
    @pins = Pin.tagged_with(@tag.name).all.order("created_at DESC").paginate(:page => params[:page], :per_page => 30).includes(:activities)
  end

  private

    def set_tag
      @tag = ActsAsTaggableOn::Tag.find_by_name(params[:id])
    end

end
