module YmUsers::ApplicationController
  
  def self.included(base)
    base.rescue_from CanCan::AccessDenied do |exception|
      flash[:error] = exception.message
      if user_signed_in?
        redirect_to root_path
      else
        redirect_to sign_in_path(:next => request.path)
      end
    end
  end
  
  def after_sign_in_path_for(resource_or_scope)
    params.delete(:next) || super
  end

end



