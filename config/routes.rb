Rails.application.routes.draw do

  # Devise routes

  # 顧客用 URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
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
      # フォロー・フォロワー
      get 'followings' => 'follow_relationships#followings', as: 'followings'
      get 'followers' => 'follow_relationships#followers', as: 'followers'
      resource :follow_relationships, only: [:create, :destroy]
    end
    resources :reviews do
      # レビューコメント、いいね
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :books, only: [:create, :index, :show] do
      # 読みたい、読んでいる、読んだ、積読いいね
      resource :wants, only: [:create, :index, :destroy]
      resource :readings, only: [:create, :index, :destroy]
      resource :reads, only: [:create, :index, :destroy]
      resource :gets, only: [:create, :index, :destroy]
    end
  end


  # Admin routes
  namespace :admin do
    get '/top' => 'homes#top'
    resources :types, only: [:edit, :create, :update, :destroy]
    resources :longs, only: [:edit, :create, :update, :destroy]
    resources :mysteries, only: [:edit, :create, :update, :destroy]
    resources :difficulties, only: [:edit, :create, :update, :destroy]
    resources :tags, only: [:edit, :create, :update, :destroy]
  end


end
