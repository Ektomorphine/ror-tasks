class RemotesController < ApplicationController
  def index
    @remotes = Remote.all
    @counter = @remotes.length
    @pluralize =  pluralization @counter
  end

  def create
    @remote = Remote.create(remote_params)
    render json: {
      text: @remote.text,
      date: @remote.created_at.strftime('%F %T %z')
    }
  end

  private
    def remote_params
      params.require(:remote).permit(:text)
    end

  def pluralization counter    
    if counter == 0 or counter > 4  
       'запросов'
    elsif counter >= 2 and counter <= 4
      'запроса'
    else 
      'запрос'
    end
  end

end
