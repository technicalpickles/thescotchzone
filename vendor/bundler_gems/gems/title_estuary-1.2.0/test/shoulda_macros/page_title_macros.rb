module PageTitleMacros
  
  def self.included(base)
    base.extend PageTitleMacros::ControllerMacros
  end

  def clear_translations!
    I18n.reload!
  end

  def define_translation(key, value)
    hash = key.to_s.split('.').reverse.inject(value) do |value, key_part|
      { key_part.to_sym => value }
    end
    I18n.backend.send :merge_translations, I18n.locale, hash
  end
  
  def assert_page_title_is(title)
    assert_equal title, @controller.page_title
  end
  
  module ControllerMacros
    
    def should_set_the_page_title_to(title)
      should "set the page title to #{title}" do
        assert_page_title_is title
      end
    end
    
  end
  
end
