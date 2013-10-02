module YmUsers::ApplicationController
  
  def self.included(base)
    base.rescue_from CanCan::AccessDenied do |exception|
      if user_signed_in?
        flash[:error] = exception.message
        redirect_to after_sign_in_path_for(current_user)
      else
        session[:next] = request.path
        redirect_to sign_in_path(:next => request.path)
      end
    end
  end
  
  def after_sign_in_path_for(resource_or_scope)
    params.delete(:next) || super
  end

end



