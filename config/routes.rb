Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   resources :posts, only: [:index, :show, :create] do
    resources :photos, only: [:create]
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
end
end