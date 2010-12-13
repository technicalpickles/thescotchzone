class ScotchesController < InheritedResources::Base
  respond_to :html, :xml, :json, :mobile

  def show
    @note = Note.new

    show! 
  end
end
