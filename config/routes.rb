Rails.application.routes.draw do
  resources :remotes

  root 'remotes#index'
end
