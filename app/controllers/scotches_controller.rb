class ScotchesController < InheritedResources::Base
  respond_to :html, :xml, :json, :mobile

  def create
    create! do |format|
      format.html { redirect_to @scotch }
      format.mobile { redirect_to @scotch }
    end
  end

  def show
    @note = Note.new

    show! 
  end
end
