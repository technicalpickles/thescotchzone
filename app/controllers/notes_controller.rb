class NotesController < InheritedResources::Base
  belongs_to :scotch, :user, :optional => true
  respond_to :html, :xml, :json, :mobile

  before_filter :authenticate, :only => [:new, :create, :edit, :destroy]
  

  def create
    create! do |format|
      format.html { redirect_to @note.scotch }
      format.mobile { redirect_to @note.scotch }
    end
  end

protected

  def build_resource
    @note ||= returning(super) do |note|
      note.user = current_user
    end
  end
end
