Sinisterbunneh::Application.routes.draw do
  resources :news
  resources :posts
  match "/gallery" => "gallery#index" 

  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end
    
  root to: "gallery#index"
end