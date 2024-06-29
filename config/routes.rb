Rails.application.routes.draw do
  
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :apples do
    resources :likes, only: [:create, :destroy]

    resources :comments, only: [:create]
  end
  resources :users, only: [:show]

  resources :blogs
  get 'blogs/index'

  
  resources :perfumes
  root 'apples#top'
end
