require File.dirname(__FILE__) + '/test_helper'
require File.dirname(__FILE__) + '/village_model_and_controller'

class SimpleCustomTitlesTest < ActionController::TestCase
  include PageTitleMacros
  tests VillagesController
  
  context 'a RESTful, titleize controller' do
    
    context 'with custom page titles set up' do

      setup { clear_translations! }
    
      context 'on a GET to :index' do
        setup do
          define_translation 'page.title.villages.index', 'Some Villages'
          get :index
        end
        should_set_the_page_title_to 'Some Villages'
      end
      
      context 'on a GET to :new' do
        setup do
          define_translation 'page.title.villages.new', 'Add a Village'
          get :new
        end
        should_set_the_page_title_to "Add a Village"
      end
      
    end
    
  end
  
end
