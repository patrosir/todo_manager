Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#index"

  resources :todos
  resources :users
  resources :sessions

  get "/signin" => "sessions#new", as: :new_session
  post "/signin" => "sessions#create", as: :session
end
