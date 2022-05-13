Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show destroy] do
      resources :comments, only: %i[index create destroy]
      resources :likes, only: %i[index create]
    end
  end

  namespace :api, :defaults => {:format => :json} do 
    resources :users, only: %i[index show] do
      resources :posts, only: %i[index new create show destroy] do
        resources :comments, only: %i[index create destroy]
        resources :likes, only: %i[index create]
      end
    end
  end
end
