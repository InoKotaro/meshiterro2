Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'

  get 'homes/top'
  get "/homes/about" => "homes#about", as: "about"

  resources :post_images, only: [:new, :create, :index, :show, :destroy] #投稿機能
  resources :users, only: [:show, :edit, :update]  #ユーザー編集機能

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
