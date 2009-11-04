require 'rubygems'
require 'test/unit'

require 'action_controller'
require 'action_controller/test_process'

require 'blueprint_layout'

ActionView::Base.send :include, BlueprintLayout::ViewHelpers
ActionController::Base.send :include, BlueprintLayout::PartialCaching
 
class BlueprintLayout::ViewTestCase < Test::Unit::TestCase
  def setup
    super
    @view = ActionView::Base.new
  end
 
  protected
  
  def show_view(template, &block)
    @html_result = ActionView::InlineTemplate.new(template).render(@view, {})
    @html_document = HTML::Document.new(@html_result, true, false)
    
    if block_given?
      assert_select("div.container", 1, "should be one container div", &block)
    end
  end
  
  def response_from_page_or_rjs
    @html_document.root
  end
end