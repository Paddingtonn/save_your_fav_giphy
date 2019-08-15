Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # get 'users/new'

  get '/signup' => 'users#new'
  get '/users' => 'users#index'

  post '/users' => 'users#create'

  resources :giphies
  root 'welcome#index'

  resources :giphy
  resources :save
  # get 'dupa' => 'giphy#lalala', as: :hello
end
