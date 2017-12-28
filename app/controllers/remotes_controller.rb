class RemotesController < ApplicationController
  def index
    @remotes = Remote.all
    @counter = @remotes.length
    @pluralize =  pluralization @counter
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

  def pluralization counter    
    if counter == 0 or counter >= 4  
       'запросов'
    elsif counter >= 2 and counter <= 4
      'запроса' 
    else 
      'запрос'

    end
  end

end
