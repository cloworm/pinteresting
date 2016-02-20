module PinFilterHelper

  def sort_by_link
    # TODO: dynamic path instead of always pins_path
    if sort_by_most_liked?
      most_recent = link_to "Most Recent", url_for(:filter => { :sort_by => "most_recent" })
      most_liked = link_to "Most Liked", url_for(:filter => { :sort_by => "most_liked" }), class: "active-option"
    else
      most_recent = link_to "Most Recent", url_for(:filter => { :sort_by => "most_recent" }), class: "active-option"
      most_liked = link_to "Most Liked", url_for(:filter => { :sort_by => "most_liked" })
    end

    raw("Sort by: #{most_recent} | #{most_liked}")
  end

end
