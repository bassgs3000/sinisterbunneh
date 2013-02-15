Sinisterbunneh::Application.routes.draw do
  resources :gallery

  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end
    
  root to: "gallery#index"
end