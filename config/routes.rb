Rails.application.routes.draw do
  get 'authors/index'
  resources :authors, :articles, :tags

  root 'authors#index'  
end
