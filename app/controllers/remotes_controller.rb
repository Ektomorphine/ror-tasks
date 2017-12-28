class RemotesController < ApplicationController
  def index
    @remotes = Remote.all
  end

  def create
    @remote = Remote.new(remote_params)
 
    @remote.save
    redirect_to remotes_index_path
  end

  private
  def remote_params
    params.require(:remote).permit(:text)
  end
end
