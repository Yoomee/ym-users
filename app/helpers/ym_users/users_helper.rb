module YmUsers::UsersHelper
  
  def first_name_or_you(user = @user, third_person_text = '', second_person_text = '')
    if current_user != user
      "#{user.first_name} #{third_person_text}".strip
    else
      "you #{second_person_text}".strip
    end
  end
  
  def first_name_or_your(user = @user, third_person_text = '', second_person_text = '')
    if current_user != user
      "#{user.first_name}'s #{third_person_text}".strip
    else
      "your #{second_person_text}".strip
    end
  end

  def name_and_role(user)
    user.role.present? ? (link_to_self(user) + "&nbsp;".html_safe + content_tag(:span, user.role, :class => "badge badge-square badge-info")) : link_to_self(user)
  end

end