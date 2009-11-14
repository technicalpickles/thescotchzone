class WelcomeController < ApplicationController
  def show
    @recent_notes = Note.descend_by_created_at.paginate(:page => 1)
  end
end
