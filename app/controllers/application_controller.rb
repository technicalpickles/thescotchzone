class ApplicationController < ActionController::Base
  include Clearance::Authentication
  include TitleEstuary

  helper :all 
  protect_from_forgery 
end
