Rails.application.routes.draw do
  get 'authors/index'
  resources :authors

  root 'authors#index'  
end
