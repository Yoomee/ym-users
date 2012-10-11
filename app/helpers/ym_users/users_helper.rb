module YmUsers::UsersHelper
  
  def first_name_or_you(user = @user)
    current_user == user ? "you" : user.first_name
  end
  
  def first_name_or_your(user = @user)
    current_user == user ? "your" : "#{user.first_name}'s"
  end

  def name_and_role(user)
    user.role.present? ? (link_to_self(user) + "&nbsp;".html_safe + content_tag(:span, user.role, :class => "badge badge-square badge-info")) : link_to_self(user)
  end

end
