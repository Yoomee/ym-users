module YmUsers::UsersController
  
  def self.included(base)
    base.expose(:user)
  end
  
  def update
    if user.save
      redirect_to(user)
    else
      render :action => "edit"
    end
  end
  
end