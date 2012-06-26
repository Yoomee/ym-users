module YmUsers::SessionHelper
  
  def admin_logged_in?
    current_user.try(:is_admin?)
  end
  
  def logged_in_as?(user)
    return false if user.nil?
    current_user == user
  end
  
  def logged_in?
    current_user
  end
  
  def logged_out?
    current_user.nil?
  end
  
end