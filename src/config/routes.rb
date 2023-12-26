Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#top'
  get '/hello_world', to: 'application#hello'
  get '/api/hello_world', to: 'application#api_hello'
  devise_for :users
end
