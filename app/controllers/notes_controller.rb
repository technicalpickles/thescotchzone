class NotesController < InheritedResources::Base
  belongs_to :scotch, :user, :optional => true

  def create
    create! { @note.scotch }
  end

protected

  def build_resource
    @note ||= returning(super) do |note|
      note.user = current_user
    end
  end
end
