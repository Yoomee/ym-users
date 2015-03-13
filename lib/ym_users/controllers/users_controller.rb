module YmUsers::UsersController

  def create
    @user = User.new(create_user_params)
    if @user.save
      redirect_to(@user)
    else
      render :action => "new"
    end
  end

  def destroy
    @user.destroy
    flash_notice(@user)
    return_or_redirect_to(manage_users_path)
  end

  def manage
    @users = User.order(:last_name)
    @admins = User.where(:role => "admin").order(:last_name)
  end

  def stats
    @registrations = [].tap do |arr|
      User.where("created_at >= ?",2.months.ago).group("DATE(created_at)").count.each do |date, count|
        arr << [date.strftime("%d/%m/%y"), count]
      end
    end
  end

  def update
    if @user.update_attributes(user_params)
      return_or_redirect_to(@user)
    else
      render :action => "edit"
    end
  end

  private
  def create_user_params
    params.require(:user).permit(permitted_user_parameters.push(:role, :password))
  end

  def user_params
    params.require(:user).permit(permitted_user_parameters)
  end

end
