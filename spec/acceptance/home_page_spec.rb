require File.dirname(__FILE__) + '/acceptance_helper'

feature "Home Page, unauthenticated", %q{
  In order to share my scotch passion
  As a scotch enthusiast
  I want to be able to find my way around thescotchzone
} do

  scenario "Navigation links" do
    visit "/"

    page.should have_link('Home')
    page.should_not have_link('My Shelf')
    page.should have_link('All Scotches')
    page.should have_link('Scotch Enthusiasts')
  end

end
