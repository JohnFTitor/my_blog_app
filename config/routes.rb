Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'

  get '/users', to: 'users#index'

  get '/users/:id', to: 'users#show', as: 'user'

  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'

  get 'posts/new', to: 'posts#new'

  post 'posts', to: 'posts#create'

  get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'

  get 'comments', to: 'comments#index'

  post 'comments', to: 'comments#create'

  get 'likes', to: 'likes#index'

  post 'likes', to: 'likes#create'

  # Defines the root path route ("/")
  # root "articles#index"
end
