Rails.application.routes.draw do

  root to: "homes#top"
  get "/about" => "homes#about"
  get "/search" => "searchs#show"


  resources :searchs, only: [:index] 
end
