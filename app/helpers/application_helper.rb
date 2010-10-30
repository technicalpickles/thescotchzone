module ApplicationHelper
  def page_title
    # FIXME fix title_estuary, or replace it with something else
    @page_title || begin
      if @scotch
        @scotch.to_s
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
end
