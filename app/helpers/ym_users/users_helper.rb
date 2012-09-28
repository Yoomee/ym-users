module YmUsers::UsersHelper
  
  def first_name_or_you(user = @user)
    current_user == user ? "you" : user.first_name
  end
  
  def first_name_or_your(user = @user)
    current_user == user ? "your" : "#{user.first_name}'s"
  end
  
end
