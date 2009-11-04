module ActionView
  module Partials
    private
    
    def render_partial_with_blueprint(*args)
      path = args.first[:partial]
      locals = args.last
      
      blueprint_cached_column_counts = session[:blueprint_cached_column_counts] ||= {}
      
      if blueprint_cached_column_counts.keys.include?(path)
        @blueprint_column_count = locals[:blueprint_width] || blueprint_cached_column_counts[path]
        blueprint_cached_column_counts[path] = @blueprint_column_count
      else
        blueprint_cached_column_counts[path] = @blueprint_column_count if @blueprint_column_count.is_a?(Fixnum) && path !~ /^layout/
      end
      
      render_partial_without_blueprint(*args)
    end
    
    alias_method_chain :render_partial, :blueprint
  end
end

module BlueprintLayout
  module PartialCaching
    def self.included(base)
      base.send :include, BlueprintLayout::PartialCaching::InstanceMethods
      base.before_filter :clear_blueprint_cache
    end
    
    module InstanceMethods
      def clear_blueprint_cache
        session[:blueprint_cached_column_counts] = nil unless request.xhr?
      end
    end
  end
end