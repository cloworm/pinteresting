module PinFilters
  extend ActiveSupport::Concern

  included do
    helper_method :sort_by_most_liked?
  end

  def sort_by_most_liked?
    filter_params[:sort_by] == "most_liked"
  end

  def apply_pin_filters(pins)
    if sort_by_most_liked?
      subquery = Pin
        .select("pins.id as pin_id, count(pins.id) as likes_count")
        .joins("INNER JOIN activities ON activities.pin_id = pins.id AND activities.type = 'like'")
        .group("pins.id")
        .order("likes_count DESC")

      pins = pins
        .joins("LEFT OUTER JOIN (#{subquery.to_sql}) as subquery ON pins.id = subquery.pin_id")
        .order("COALESCE(subquery.likes_count, 0) DESC")
    else
      pins = pins.order("created_at DESC")
    end
  end

  def filter_params
    @filter_params ||= begin
      p = if params[:filter]
            params.require(:filter).permit(:sort_by)
          else
            {}
          end
      p[:sort_by] ||= "most_recent"
      p
    end
  end

end
