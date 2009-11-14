require File.dirname(__FILE__) + '/test_helper'
require File.dirname(__FILE__) + '/village_model_and_controller'

class InterpolatedPageTitlesTest < ActionController::TestCase
  include PageTitleMacros
  tests VillagesController
  
  context 'a RESTful, titleize controller' do
    
    context 'with custom page titles that involve interpolation' do
      
      setup { clear_translations! }
        
      setup do
        self.class.controller_class.class_eval do
          def interpolation_options
            {
              :villages_count => 12,
              :village_name   => 'Rhinoceros Town'
            }
          end
        end
      end
    
      context 'on a GET to :index' do
        setup do
          define_translation 'page.title.villages.index', '{{villages_count}} Villages'
          get :index
        end
        should_set_the_page_title_to '12 Villages'
      end
      
      context 'on a GET to :show' do
        setup do
          Village.stubs(:find).returns(Village.new('anything'))
          define_translation 'page.title.villages.show', '{{village_name}}'
          get :show, :id => 29291
        end
        should_set_the_page_title_to 'Rhinoceros Town'
      end
      
      context 'that fails to provide a necessary interpolation string' do
        setup do
          define_translation 'page.title.villages.new', '{{not_specified_by_the_controller}}'
          get :new
        end
        should "raise a translation error" do
          assert_raises I18n::MissingInterpolationArgument do
            @controller.page_title
          end
        end
      end
      
    end
    
  end
  
end
