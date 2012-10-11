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
    return_or_redirect_to(manage_users_path)
  end

  def manage
    @users = User.all
  end

  def stats
    @registrations = [].tap do |arr|
      User.where("created_at >= ?",2.months.ago).group("DATE(created_at)").count.each do |date, count|
        arr << [date.strftime("%d/%m/%y"), count]
      end
    end
  end

  def update
    if user.save
      redirect_to(user)
    else
      render :action => "edit"
    end
  end
  
end