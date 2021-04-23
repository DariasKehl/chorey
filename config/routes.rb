Rails.application.routes.draw do
    
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#authCreate' 

  get 'welcome', to: 'sessions#welcome'
  
  #logout
  delete '/logout' => 'sessions#destroy'
  
  resources :users, only: [:new, :create]
  resources :chore_lists
  resources :tasks
  post "complete", to: "chore_lists#complete"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
