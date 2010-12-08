class WelcomeController < ApplicationController
  def show
    @recent_notes = Note.descend_by_created_at.paginate(:page => 1)

    respond_to do |format|
      format.mobile
      format.html
    end

  end
end
