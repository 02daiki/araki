Rails.application.routes.draw do
  devise_for :users
  root to: 'blogs#index'
  resources :blogs

  # 保留ページのルーティング
  get 'blogs/:id/task' => 'blogs#task', as:'task_blog'

  #ホームページのルーティング
  get 'home/home' => 'home#home'
  # トップページのルーティング
  get 'home/index' => 'home#index'
  # タスクマネージページのルーティング
  get 'home/manager' => 'home#manager'


end
