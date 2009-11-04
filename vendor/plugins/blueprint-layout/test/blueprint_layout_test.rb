require 'test_helper'

class BlueprintLayoutTest < BlueprintLayout::ViewTestCase
  def test_basic_structure
    template = %(
      <% container do %>
        <% header do %>Text<% end %>
        <% column do %>
          <% header do %>More text<% end %>
          <% column :half do %>
            <% header do %>More text<% end %>
            <% column :one_third do %>
              <% header do %>More text<% end %>
              one third of one half of 24 is 4
            <% end %>
            <% column :one_third, :last, prepend_one_third do %>
              <% header do %>More text<% end %>
              one third of one half of 24 is 4 (but prepended 4 as well)
            <% end %>
            <hr/>
            more text
          <% end %>
          <% column :half, :last do %>
            <% header do %>More text<% end %>
            second column
          <% end %>
          <hr/>
          text
        <% end %>
      <% end %>
    )
    
    show_view template do |v|
      assert_select "h1", 1
      assert_select "h2", 1
      assert_select "h3", 2
      assert_select "h4", 2
      assert_select ".span-24", 1
      assert_select ".span-12", 2
      assert_select ".span-4", 2
      assert_select ".prepend-4", 1
      assert_select ".span-24.last", 1
      assert_select ".span-12.last", 1
      assert_select ".span-4.last", 1
      assert_select "hr", 2
    end
  end
end
