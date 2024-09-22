Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  
  #9 ルーティングを一括して自動生成してくれる
  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  
  get 'homes/about', to:'homes#about', as: 'about'
  
  
end
