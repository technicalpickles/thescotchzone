class ApplicationController < ActionController::Base
  include Clearance::Authentication
  include TitleEstuary

  helper :all 
  protect_from_forgery 

  def interpolation_options
    returning({}) do |result|
      result[:resource] = resource if params[:id].present?
    end
  end

  hide_action :interpolation_options
  
end
