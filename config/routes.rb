Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  resources :users
  resources :operas
  resources :songs
  resources :notes
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
