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
  get "/search" => "searchs#show"
  resources :searchs, only: [:index]


  # user routes
  scope module: 'user' do
    resources :users, only: [:show, :edit, :update] do
      get 'followings' => 'follow_relationships#followings', as: 'followings'
      get 'followers' => 'follow_relationships#followers', as: 'followers'
      resource :follow_relationships, only: [:create, :destroy]
    end
    resources :reviews do
      resources :comments, only: [:create, :destroy]
      resources :difficulty_relationships, only: [:create, :update, :destroy]
      resources :mystery_relationships, only: [:create, :update, :destroy]
      resources :tag_relationships, only: [:create, :update, :destroy]
      resource :favorites, only: [:create, :destroy]
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
