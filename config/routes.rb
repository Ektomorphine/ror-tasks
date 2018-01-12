Rails.application.routes.draw do
  get 'authors/index'

  resources :authors, :articles, :tags, :report_list

  root 'authors#index'  
end
