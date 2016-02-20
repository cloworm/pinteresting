module PinFilterHelper

  def sort_by_link(options = {})
    if sort_by_most_liked?
      most_recent = link_to "Most Recent", url_for({ :filter => { :sort_by => "most_recent" } }.merge(options))
      most_liked = link_to "Most Liked", url_for({ :filter => { :sort_by => "most_liked" } }.merge(options)), class: "active-option"
    else
      most_recent = link_to "Most Recent", url_for({ :filter => { :sort_by => "most_recent" } }.merge(options)), class: "active-option"
      most_liked = link_to "Most Liked", url_for({ :filter => { :sort_by => "most_liked" } }.merge(options))
    end

    raw("Sort by: #{most_recent} | #{most_liked}")
  end

end
