require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root 'posts#index'
  #root 'posts#index'
 # post "/companys", to: "companys#index"
  get "/companies", to: "companies#index"
  get "/requests", to: "requests#index"
  get " /posts", to: "posts#index"
  get "/comments", to: "comments#create"
  get '/search', to: "posts#search"
  get '/about', to: "posts#about"
  get '/Mypost', to: "posts#Mypost"
  get '/set_click', to: "posts#set_click"
  get '/update_feild', to: "posts#update_feild"
  get '/post_csv', to: "posts#post_csv", defaults: { format: :csv }, as: :post_csv
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :posts do
  #resources :posts, only: [:index, :show, :create] do
      resources :photos, only: [:create]
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
      
    end
      resources :users do
        resources :relationships, only: [:create, :destroy]
      end
      #resources :relationships, only: [:destroy]
    resources :companies
end
