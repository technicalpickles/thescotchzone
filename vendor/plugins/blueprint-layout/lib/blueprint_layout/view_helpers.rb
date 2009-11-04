module BlueprintLayout
  module ViewHelpers
    MULTIPLES = {
      :one_twentyfourth =>          (1/24.to_f),
      :one_twelfth =>               (1/12.to_f),
      :one_eigth =>                 (1/8.to_f),
      :one_sixth =>                 (1/6.to_f),
      :five_twentyfourths =>        (5/24.to_f),
      :one_fourth =>                (1/4.to_f),
      :seven_twentyfourths =>       (7/24.to_f),
      :one_third =>                 (1/3.to_f),
      :three_eigths =>              (3/8.to_f),
      :five_twelfths =>             (5/12.to_f),
      :eleven_twentyfourths =>      (11/24.to_f),
      :one_half =>                  (1/2.to_f),
      :half =>                      (1/2.to_f),
      :thirteen_twentyfourths =>    (13/24.to_f),
      :seven_twelfths =>            (7/12.to_f),
      :five_eigths =>               (5/8.to_f),
      :two_thirds =>                (2/3.to_f),
      :seventeen_twentyfourths =>   (17/24.to_f),
      :three_fourths =>             (3/4.to_f),
      :nineteen_twentyfourths =>    (19/24.to_f),
      :five_sixths =>               (5/6.to_f),
      :seven_eigths =>              (7/8.to_f),
      :eleven_twelfths =>           (11/12.to_f),
      :twentythree_twentyfourths => (23/24.to_f),
      :full =>                      (1.to_f)
    }
    
    def column(size="", *args, &block)
      @blueprint_column_count ||= application_width
      col(size, *args, &block)
    end
    
    def header(*args, &block)
      options = args.extract_options!
      size = (temp_size = (@blueprint_level || 0) + 1) > 6 ? 6 : temp_size
      concat(content_tag("h#{size}", capture(&block), options) + (args.include?(:with_rule) ? "<hr/>" : ""))
    end
    
    def container(options = {}, &block)
      @blueprint_column_count = options.delete(:size) || application_width
      concat(content_tag(:div, capture(&block), {:class => "container"}.merge(options)))
    end
    
    def method_missing(call, *args)
      call.to_s =~ /^((append|prepend|push|pull|span)_)?(.+)$/
      class_name = $2 || 'span'
      class_width = $3
      
      if MULTIPLES.keys.include?(class_width.to_sym)
        width = @blueprint_column_count || application_width
        "#{class_name}-#{(width*MULTIPLES[class_width.to_sym]).to_i}"
      else
        super(call, *args)
      end
    end
    
    private
    
    def col(size="", *args, &block)
      size = :full if size.blank?
      
      increase_blueprint_depth(size)
      output_tag = generate_output_tag(size, args, &block)
      
      if block_given? && block_is_within_action_view?(block)
        concat(output_tag)
        decrease_blueprint_depth(size)
      else
        decrease_blueprint_depth(size)
        output_tag
      end
    end
    
    def increase_blueprint_depth(size)
      @blueprint_level = @blueprint_level ? @blueprint_level + 1 : 1
      @blueprint_current_width = @blueprint_column_count.to_s
      @blueprint_column_count = size.to_s =~ /^\d+$/ ? size.to_s.to_i : (@blueprint_column_count*MULTIPLES[size]).to_i
    end
    
    def decrease_blueprint_depth(size)
      @blueprint_column_count = size.is_a?(Integer) ? @blueprint_current_width.to_i : (@blueprint_column_count/MULTIPLES[size]).to_i
      @blueprint_current_width = nil
      @blueprint_level -= 1
    end
    
    def generate_output_tag(size, *args, &block)
      options = args.extract_options!
      css_classes = []
      !(opt_classes = options.delete(:class)).blank? ? opt_classes.split(/ /).each {|c| css_classes << c } : ""
      
      css_classes << "span-#{@blueprint_column_count}" unless options[:suppress_span]
      css_classes << "last" if size.to_sym == :full
      args.each {|a| css_classes << a} if args.any?
      
      content_tag(:div, capture(&block), {:class => css_classes.uniq.compact.join(" ").strip}.merge(options))
    end
    
    def application_width
      ApplicationController::BLUEPRINT_COLUMN_COUNT rescue 24
    end
    
    BLOCK_CALLED_FROM_ERB = 'defined? __in_erb_template'
    
    if RUBY_VERSION < '1.9.0'
      # Check whether we're called from an erb template.
      # We'd return a string in any other case, but erb <%= ... %>
      # can't take an <% end %> later on, so we have to use <% ... %>
      # and implicitly concat.
      def block_is_within_action_view?(block)
        block && eval(BLOCK_CALLED_FROM_ERB, block)
      end
    else
      def block_is_within_action_view?(block)
        block && eval(BLOCK_CALLED_FROM_ERB, block.binding)
      end
    end
  end
end