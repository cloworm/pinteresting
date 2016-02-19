module BreadcrumbsHelper

  private

  def add_crumb(title, uri)
    crumbs.push([title, uri])
  end

  def crumbs
    @crumbs ||= []
  end

end
