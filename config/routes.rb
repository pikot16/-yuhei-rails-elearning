Rails.application.routes.draw do
  root 'home#top'
  get '/users', to: 'home#top' # 仮の措置
  post '/signup', to: 'users#create'
  resources :users # ユーザー登録失敗時にURLが/userとなってトップページに戻る
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
