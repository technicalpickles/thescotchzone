module ApplicationHelper
  def page_title
    @page_title || "PLACEHOLDER" # FIXME fix title_estuary, or replace it with something else
  end

  def page_title=(page_title)
    @page_title = page_title
  end
end
