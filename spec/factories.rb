FactoryGirl.define do

  factory :user do
    first_name "Charles"
    last_name "Barrett"
    email {"#{first_name.downcase}@#{last_name.downcase}.com"}
    password "password"
  end

  factory :admin_user, :parent => :user do
    role 'admin'
  end

end