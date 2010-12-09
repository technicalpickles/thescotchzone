module ApplicationHelper
  def page_title
    # FIXME fix title_estuary, or replace it with something else
    @page_title || begin
      if @scotch
        if @scotch.new_record?
          "Tell us about a scotch"
        else
          @scotch.to_s
        end
      elsif @scotches
        "Scotches"
      else
        nil
      end
    end
  end

  def page_title=(page_title)
    @page_title = page_title
  end

  def navigation_link_to(name, options = {}, html_options = {}, &block)
    if current_page?(options)
      html_options[:class] ||= ""
      html_options[:class] += " ui-btn-active"
    end

    link_to name, options, html_options, &block
  end
end
