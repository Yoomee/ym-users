Rails.application.routes.draw do
  
  devise_for :users
  devise_scope :user do
    get "login", :to => "devise/sessions#new", :as => "sign_in"
    delete "logout", :to => "devise/sessions#destroy", :as => "sign_out"
    get "users/change_password", :to => "devise/registrations#edit", :as => "change_password"
  end
  resources :users
  
end
