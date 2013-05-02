Rails.application.routes.draw do
  
  devise_for :users
  devise_scope :user do
    get "login", :to => "devise/sessions#new", :as => "sign_in"
    delete "logout", :to => "devise/sessions#destroy", :as => "sign_out"
    get "sign-up", :to => "devise/registrations#new", :as => "sign_up" unless Settings.dont_set_sign_up_route == true
    get "users/change_password", :to => "devise/registrations#edit", :as => "change_password"
  end
  resources :users do 
    collection do
      get 'stats'
      get 'manage'
    end
  end
  match 'super' => 'super#index'
  match 'super/morph' => 'super#morph', :via => :post
  
end
