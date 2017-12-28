Rails.application.routes.draw do
  get 'remotes/index'

  resource :remotes

  root 'remotes#index'
end
