Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'

  get '/sessions/new', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/sessions/destroy', to: 'sessions#destroy'

  post '/likes', to: 'likes#create'
  delete '/', to: 'users#destroy'
  delete '/posts/:id/edit', to: 'posts#delete_image_attachment'
  resources :posts
  resources :users
end
