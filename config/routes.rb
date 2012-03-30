Rails.application.routes.draw do
  
  devise_for :users
  devise_scope :user do
    get "login", :to => "devise/sessions#new", :as => "sign_in"
    delete "logout", :to => "devise/sessions#destroy", :as => "sign_out"
  end
  resources :users
  
end
