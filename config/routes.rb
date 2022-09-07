Rails.application.routes.draw do

  # Devise routes

  # ゲストログイン用
  devise_scope :user do
    post 'user/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 顧客用 URL /users/sign_in ...
  devise_for :user,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用 URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # user routes
  scope module: 'public' do
    root to: "homes#top"
    get "/about" => "homes#about"
    resources :searches, only: [:index]

    # 通報ページ
    resources :reports, only: [:new, :create]
    get "/new_tag" => "reports#new_tag"
    post "/new_tag" => "reports#new_tag_create"

    # DM機能
    resources :direct_messages, only: [:show, :create]
    resources :dm_rooms, only: [:index]


    resources :users, only: [:show, :edit, :update] do
      get 'quit' => 'users#quit'
      patch 'withdraw' => 'users#withdraw'
      get 'time_line' => 'users#time_line', as: 'time_line'
      # フォロー・フォロワー
      get 'followings' => 'follow_relationships#followings', as: 'followings'
      get 'followers' => 'follow_relationships#followers', as: 'followers'
      resource :follow_relationships, only: [:create, :destroy]

      # レビュー、読みたい、読んでいる、読んだ、積読いいね一覧ページ
      get 'reviews' => 'reviews#index', as: 'review'
      get 'wants' => 'wants#index', as: 'want'
      get 'readings' => 'readings#index', as: 'reading'
      get 'reads' => 'reads#index', as: 'read'
      get 'gets' => 'gets#index', as: 'get'

      # 通知画面
      resources :notifications, only: [:index, :delete]
      delete :notifications, to: 'notifications#destroy_all'
    end

    resources :reviews, only: [:create, :new, :edit, :update, :show, :destroy] do
      # レビューコメント、いいね
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

    # レビュー検索画面
    get 'review/search' => 'reviews#search'
    # ランキング画面
    get 'rank' => 'ranks#rank'

    resources :books, only: [:create, :show] do
      # 読みたい、読んでいる、読んだ、積読いいね機能
      resource :wants, only: [:create, :index, :destroy]
      resource :readings, only: [:create, :index, :destroy]
      resource :reads, only: [:create, :index]
      resource :gets, only: [:create, :index, :destroy]
      # 本に対する自分のレビュー表示画面
      get 'my_review' => 'books#my_review', as: 'my_review'
    end

    # 読んだ本は再読機能があるため、独立してread.idで個別に消せるように
    resources :reads, only: [:destroy]
  end


  # Admin routes
  namespace :admin do
    get '/top' => 'homes#top'
    resources :reports, only: [:update, :show]
    resources :users, only: [:update, :show, :index]
    resources :reviews, only: [:update, :edit, :destroy, :show, :index]
    resources :types, only: [:edit, :create, :update, :destroy, :index]
    resources :longs, only: [:edit, :create, :update, :destroy, :index]
    resources :mysteries, only: [:edit, :create, :update, :destroy, :index]
    resources :difficulties, only: [:edit, :create, :update, :destroy, :index]
    resources :tags, only: [:edit, :create, :update, :destroy, :index]
  end


end
