class ScotchesController < InheritedResources::Base
  
  def index
    @scotches = Scotch.all
  end

  def new
    @scotch = Scotch.new
  end
  
  def create
    @scotch = Scotch.create! params[:scotch]

    redirect_to @scotch
  end

  def show
    @scotch = Scotch.find params[:id] 
  end

end
