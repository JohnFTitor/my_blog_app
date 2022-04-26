Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'

  get '/users', to: 'users#index'

  get '/users/:id', to: 'users#show'

  get 'users/:user_id/posts', to: 'posts#index'

  # Defines the root path route ("/")
  # root "articles#index"
end
