class UsersController < ApplicationController
  include YmUsers::UsersController
  load_and_authorize_resource

  private
  def user_params
    params.require(:user).permit(:bio, :email, :first_name, :image, :last_name, :retained_image)
  end

end
