Rails.application.routes.draw do
  
  root to: 'homes#top'
  devise_for :users
  get 'homes/top', to: 'homes#top'
  get 'homes/about', to:'homes#about'
  #9 ルーティングを一括して自動生成してくれる
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  
  
  
  
end
