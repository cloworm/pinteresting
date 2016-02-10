class TagsController < ApplicationController

  def show
    @tag =  ActsAsTaggableOn::Tag.find_by_name(params[:id])
    @pins = Pin.tagged_with(@tag.name).all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10).includes(:activities)
  end

end
