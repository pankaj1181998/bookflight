Rails.application.routes.draw do
  resources :iata_codes
  get 'book/flight'
  root :to => 'book#flight'
   # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
