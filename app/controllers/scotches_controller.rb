class ScotchesController < InheritedResources::Base
  def show
    @note = Note.new

    show!
  end
end
