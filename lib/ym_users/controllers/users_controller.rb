module YmUsers::UsersController
  
  def self.included(base)
    base.expose(:user)
  end
  
  def create
    if user.save
      redirect_to(user)
    else
      render :action => "new"
    end
  end
  
  def destroy
    user.destroy
    flash_notice(user)
    return_or_redirect_to(user)
  end
  
  def update
    if user.save
      redirect_to(user)
    else
      render :action => "edit"
    end
  end
  
end