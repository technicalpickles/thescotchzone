module TitleEstuary
  
  module InheritedResourcesSupport
    
    private
    
    # @return [#to_s] the requested_resource as loaded by
    #                 InheritedResources.
    def page_title_resource
      # it should be loaded by now, but if not, don't
      # make a special request on our behalf:
      get_resource_ivar
    end
    
    # @return [String] an improved guess for the name of the requested resource.
    def page_title_singular_resource_name
      resource_name = if resource_class
        if resource_class.respond_to?(:human_name)
          resource_class.human_name
        else
          resource_class.name.humanize
        end
      else
        params[:controller].to_s.singularize
      end
    end
  end
  
end
