Rails.application.routes.draw do
  
  root to: "homes#top"
  get "/about" => "homes#about"
  
  resources :searchs, only: [:index, :show]

end
