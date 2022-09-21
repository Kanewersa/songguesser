Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" }

  root "pages#home"
  get "/vouchers/:id", to: "vouchers#user_vouchers", as: :user_vouchers
  post "/song_availability", to: "songs#availability"
  get '/error', to: 'pages#error', as: :error
  get '/contact', to: 'pages#contact', as: :contact
  post '/contact', to: 'pages#send_contact', as: :contact_post
  get '/info', to: 'pages#info', as: :info
  get '/admin', to: 'pages#admin', as: :admin
  get '/used_vouchers', to: 'pages#used_vouchers', as: :used_vouchers
  post '/use_voucher/:id', to: 'vouchers#use_voucher', as: :use_voucher

  resources :songs
  resources :answers
  resources :voucher_templates
end
