Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  # building functionality for user login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  # building functionality for user sign up
  get '/signup' => 'users#new' 
  # why is there no #post requirement for signup? 
  delete '/logout' => 'sessions#destroy'

  resources :users
  resources :operas
  resources :songs
  resources :notes
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
