Rails.application.routes.draw do


  # 顧客用 URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  # 管理者用 URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }


  root to: "homes#top"
  get "/about" => "homes#about"
  get "/search" => "searchs#show"

  resources :searchs, only: [:index]

  scope module: 'user' do
    resources :user, only: [:show, :edit, :update]
  end

end
