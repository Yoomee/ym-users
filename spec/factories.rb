FactoryGirl.define do

  factory :user do |f|
    f.first_name "Charles"
    f.last_name "Barrett"
    f.email "charles@barrett.com"
    f.password "password"
  end

  factory :admin_user, :parent => :user do |f|
    f.role 'admin'
  end

end