Sinisterbunneh::Application.routes.draw do
  resources :galleries

  devise_for :users
  root to: "gallery#index"
end