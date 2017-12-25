Rails.application.routes.draw do
  get 'authors/index'

  root 'authors#index'  
end
