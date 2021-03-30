Rails.application.routes.draw do
  get 'users/username:string'

  get 'users/email:string'

  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
