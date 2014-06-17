Rails.application.routes.draw do

  ym_users_routes
  mount YmUsers::Engine => "/ym_users"
end
