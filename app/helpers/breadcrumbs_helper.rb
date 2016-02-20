module BreadcrumbsHelper

  module ClassMethods
    def crumb(before_action_options = {}, &title_uri_block)
      before_action(before_action_options) do
        title, uri = instance_eval(&title_uri_block)
        crumb(title, uri)
      end
    end
  end

  def self.included(base_class)
    base_class.send(:extend, ClassMethods)
  end

  private

  # Append a breadcrumb to the chain of breadcrumbs.
  # If a uri is not provided, render a title as raw html
  #
  # @param title [String] title of the link
  # @param uri [String, nil] (nil) the uri to link_to
  #
  # @example
  #   crumb("Projects", pins_path) # Adds a breadcrumb with the text Project that links to pins_path
  #   crumb(view_context.raw("Sort by: #{view_context.link_to "Most Recent", most_recent_path}" # Adds a breadcrumb with text Most Recent that links to most recent posts
  def crumb(title, uri = nil)
    crumbs.push([title, uri])
  end

  def crumbs
    @crumbs ||= []
  end

end
