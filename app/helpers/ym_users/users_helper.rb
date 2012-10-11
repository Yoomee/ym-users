module YmUsers::UsersHelper
  
  def first_name_or_you(user = @user)
    current_user == user ? "you" : user.first_name
  end
  
  def first_name_or_your(user = @user)
    current_user == user ? "your" : "#{user.first_name}'s"
  end

  def name_and_role(user)
    user.role.present? ? (user.full_name + "&nbsp;" + content_tag(:span, user.role, :class => "badge badge-square badge-info")).html_safe : user.full_name
  end

end
