module YmUsers::SessionHelper
  
  def admin_logged_in?
    current_user.try(:is_admin?)
  end
  
  def logged_in_as?(*users)
    return false if current_user.nil?
    users.flatten.include?(current_user)
  end
  
end