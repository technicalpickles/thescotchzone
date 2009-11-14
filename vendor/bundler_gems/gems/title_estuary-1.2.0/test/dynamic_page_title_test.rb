require File.dirname(__FILE__) + '/test_helper'
require File.dirname(__FILE__) + '/village_model_and_controller'

VillagesController.class_eval do
  def index_with_dynamic_title
    self.page_title = 'A Custom Title'
    index_without_dynamic_title
  end
  alias_method :index_without_dynamic_title, :index
end

class DynamicPageTitle < ActionController::TestCase
  include PageTitleMacros
  tests VillagesController
  
  context 'a RESTful, titleize controller' do
    
    context 'that sets a page title dynamically' do
      
      setup do
        clear_translations!
        VillagesController.class_eval do
          alias_method :index, :index_with_dynamic_title
        end
      end
      
      teardown do
        VillagesController.class_eval do
          alias_method :index, :index_without_dynamic_title
        end
      end
      
      should 'use the dynamic title instead of the default' do
        get :index
        assert_page_title_is 'A Custom Title'
      end
      
      should 'use the dynamic title instead of a custom one from the I18n framework' do
        define_translation 'page.title.villages.index', 'something else'
        get :index
        assert_page_title_is 'A Custom Title'
      end
      
    end
    
  end
  
end
