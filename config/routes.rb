Rails.application.routes.draw do
  root 'home#top'
  get '/users', to: 'home#top' # 仮の措置
  get '/users/index', to: 'users#index'
  post '/signup', to: 'users#create'
  get '/dashboard', to: 'home#dashboard'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # resources :users # ユーザー登録失敗時にURLが/userとなってトップページに戻る
  resources :relationships, only: [:create, :destroy]
  resources :users do
    member do # ??
      get :following, :followers
    end
  end

  resources :categories
  resources :lessons do
    resources :answers
  end  

  namespace :admin do
    resources :users, only: [:index, :update]
  end

  namespace :admin do
    resources :categories do
      resources :words
    end
  end


end