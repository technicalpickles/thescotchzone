module TitleEstuary
  
  module HighVoltageSupport
    
    private
    
    def default_page_title_from_controller_and_action
      params[:action] == 'show' ? params[:id].titleize : super
    end
    
    def page_title_i18n_key
      "page.title.pages.#{params[:id]}"
    end
    
  end
  
end
