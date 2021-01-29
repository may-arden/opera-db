Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  # building functionality for user login; need view page
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  # building functionality for user sign up; need view page 
  get '/signup' => 'users#new' 

  resources :users
  resources :operas
  resources :songs
  resources :notes
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
