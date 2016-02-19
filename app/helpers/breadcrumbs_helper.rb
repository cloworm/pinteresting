module BreadcrumbsHelper

  module ClassMethods
    def crumb(before_action_options = {}, &title_uri_block)
      before_action(before_action_options) do
        title, uri = instance_eval(&title_uri_block)
        add_crumb(title, uri)
      end
    end
  end

  def self.included(base_class)
    base_class.send(:extend, ClassMethods)
  end

  private

  def add_crumb(title, uri)
    crumbs.push([title, uri])
  end

  def crumbs
    @crumbs ||= []
  end

end
