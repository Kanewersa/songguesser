Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :songs
  resources :answers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#home"
  get "/home", to: "application#home"
end
