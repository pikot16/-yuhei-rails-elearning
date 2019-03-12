Rails.application.routes.draw do
  root 'home#top'
  get '/users', to: 'home#top' # 仮の措置
  get '/users/index', to: 'users#index'
  post '/signup', to: 'users#create'
  get '/dashboard', to: 'sessions#show'
  get 'login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users # ユーザー登録失敗時にURLが/userとなってトップページに戻る
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
