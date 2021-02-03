Rails.application.routes.draw do

  # match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post] 
  # get '/' => 'welcome#home'

  get '/auth/:provider/callback' => 'sessions#omniauth'

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new' 
  delete '/logout' => 'sessions#destroy'


  resources :notes
  resources :operas

  resources :songs do
    resources :notes, only: [:new, :create, :index, :show]
  end 

  resources :users
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
