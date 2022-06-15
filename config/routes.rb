Rails.application.routes.draw do

  # Devise routes
  
  # ゲストログイン用
  devise_scope :user do
    post 'user/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end

  # 顧客用 URL /users/sign_in ...
  devise_for :user,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  # 管理者用 URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }


  # 共通routes
  root to: "homes#top"
  get "/about" => "homes#about"
  resources :searchs, only: [:index]


  # user routes
  scope module: 'user' do
    resources :users, only: [:show, :edit, :update] do
      get 'quit' => 'users#quit'
      patch 'withdraw' => 'users#withdraw'
      get 'time_line' => 'users#time_line', as: 'time_line'
      # フォロー・フォロワー
      get 'followings' => 'follow_relationships#followings', as: 'followings'
      get 'followers' => 'follow_relationships#followers', as: 'followers'
      resource :follow_relationships, only: [:create, :destroy]

      # 読みたい、読んでいる、読んだ、積読いいね一覧ページ
      get 'wants' => 'wants#index', as: 'want'
      get 'reading' => 'readings#index', as: 'reading'
      get 'reads' => 'reads#index', as: 'read'
      get 'gets' => 'gets#index', as: 'get'
    end
    resources :reviews, only: [:create, :new, :edit, :update, :show, :destroy] do
      # レビューコメント、いいね
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get 'review/search' => 'reviews#search'

    resources :books, only: [:create, :show] do
      # 読みたい、読んでいる、読んだ、積読いいね機能
      resource :wants, only: [:create, :index, :destroy]
      resource :readings, only: [:create, :index, :destroy]
      resource :reads, only: [:create, :index, :destroy]
      resource :gets, only: [:create, :index, :destroy]
    end
  end


  # Admin routes
  namespace :admin do
    get '/top' => 'homes#top'
    get '/tags' => 'homes#tags'
    resources :users, only: [:update, :show, :index]
    resources :reviews, only: [:update, :edit, :destroy, :show, :index]
    resources :types, only: [:edit, :create, :update, :destroy]
    resources :longs, only: [:edit, :create, :update, :destroy]
    resources :mysteries, only: [:edit, :create, :update, :destroy]
    resources :difficulties, only: [:edit, :create, :update, :destroy]
    resources :tags, only: [:edit, :create, :update, :destroy]
  end


end
