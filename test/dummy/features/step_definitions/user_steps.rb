Given(/^a user$/) do
  @user = create(:user)
end

Given(/^a new user$/) do
  @user = build(:user)
end

Given(/^that I am logged in$/) do
  sign_in_user
end

Given(/^that I am not logged in$/) do
end

Given(/^that I am logged in as an admin$/) do
  sign_in_admin
end

Given(/^there are (\d+) users$/) do |x|
  create_list(:user, x.to_i)
end

When(/^I edit my details$/) do
  visit edit_user_path(@user)
  @user[:email] = 'new-email@example.com'
  @user[:first_name] = 'DifferentFirstName'
  @user[:last_name] = 'DifferentLastName'
  fill_in 'user_email', :with => 'new-email@example.com'
  fill_in 'user_first_name', :with => 'DifferentFirstName'
  fill_in 'user_last_name', :with => 'DifferentLastName'
  click_button 'Save'
end

When(/^I go to (?:my|the user) profile$/) do
  visit user_path(@user)
end

When(/^I go to the sign up page$/) do
  visit sign_up_path
end

When(/^I sign in$/) do
  sign_in
end

When(/^I sign up$/) do
  fill_in 'user_email', :with => @user[:email]
  fill_in 'user_first_name', :with => @user[:first_name]
  fill_in 'user_last_name', :with => @user[:last_name]
  fill_in 'user_password', :with => 'password'
  fill_in 'user_password_confirmation', :with => 'password'
  click_button 'Sign up'
end

Then(/^I see (?:my|the user) details$/) do
  %w(first_name last_name).each do |attr|
    page.should have_content(@user.send(attr))
  end
end

Then(/^I should see the access denied message$/) do
  page.should have_content "You are not authorized to access this page."
end

Then(/^I see the welcome flash$/) do
  page.should have_content('You have signed up successfully')
end

private
def create_admin
  @user = create(:user, role: 'admin')
end

def create_user
  @user = create(:user)
end

def sign_in
  visit sign_in_path
  fill_in 'user_email', :with => @user[:email]
  fill_in 'user_password', :with => 'password'
  click_button 'Login'
end

def sign_in_admin
  create_admin
  sign_in
end

def sign_in_user
  create_user
  sign_in
end
