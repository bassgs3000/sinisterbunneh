Sinisterbunneh::Application.routes.draw do

  resources :locks


  resources :news, :posts, :commissions

  match "/gallery" => "gallery#index" 

  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end
    
  root to: "gallery#index"
end