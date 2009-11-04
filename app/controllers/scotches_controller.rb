class ScotchesController < ApplicationController
  def index
    @scotches = Scotch.all
  end
end
