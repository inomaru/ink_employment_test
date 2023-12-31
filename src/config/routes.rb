Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#top'
  get '/hello_world', to: 'application#hello'
  get '/api/hello_world', to: 'application#api_hello_world'
  get '/register', to: 'application#register'
  post '/logout', to: 'application#logout'
  get '/auth', to: 'auth#new'
  post '/auth', to: 'auth#create'
  devise_for :users
  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy'
  end
  get '/users', to: 'application#users'
end
