module PinFilterHelper

  def sort_by_link(options = {})
    most_recent_class = sort_by_most_liked? ? "" : "active-option"
    most_liked_class = sort_by_most_liked? ? "active-option" : ""

    most_recent = link_to "Most Recent", url_for({ :filter => { :sort_by => "most_recent" } }.merge(options)), class: most_recent_class
    most_liked = link_to "Most Liked", url_for({ :filter => { :sort_by => "most_liked" } }.merge(options)), class: most_liked_class

    raw("Sort by: #{most_recent} | #{most_liked}")
  end

end
