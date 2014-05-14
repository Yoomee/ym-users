module ActionDispatch::Routing
  class Mapper
  
    def ym_users_routes(options = {})
      options.reverse_merge!(:devise => true)
      
      if options[:devise]
        devise_for :users
        devise_scope :user do
          get 'login', :to => 'devise/sessions#new', :as => 'sign_in'
          delete 'logout', :to => 'devise/sessions#destroy', :as => 'sign_out'
          get 'sign-up', :to => 'devise/registrations#new', :as => 'sign_up'
          get 'change-password', :to => 'devise/registrations#edit', :as => 'change_password'
          get 'reset-password', :to => 'devise/passwords#new', :as => 'reset_password'
        end
      end

      resources :users do
        collection do
          get 'stats'
          get 'manage'
          post 'create_user'
        end
      end
      get 'super' => 'super#index'
      match 'super/morph' => 'super#morph', :via => :post
    end
  
  end
end