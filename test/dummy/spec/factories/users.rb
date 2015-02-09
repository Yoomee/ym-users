FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "John#{n}" }
    last_name 'Doe'
    sequence(:email) { |n| "user_#{n}@yoomee.com" }
    password 'password'
    role ''
  end

  factory :admin_user, :parent => :user do
    role 'admin'
  end

end
