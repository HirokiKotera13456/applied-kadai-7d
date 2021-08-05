Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get '/search', to: 'searchs#search'
  get "home/about" => "homes#about" 
  resources :books, only: [:edit, :create, :index, :show, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end