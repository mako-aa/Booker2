Rails.application.routes.draw do
  
  root to: 'homes#top'
  devise_for :users
 
  get 'home/about', to:'homes#about'
  #9 ルーティングを一括して自動生成してくれる
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:index, :show, :edit, :update]
  
  
  
  
end
