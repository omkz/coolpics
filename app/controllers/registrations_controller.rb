class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:avatar, :username, :firstname, :lastname, :bio, :location, :birthday, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:avatar, :username, :firstname, :lastname, :email, :bio, :location, :birthday, :password, :password_confirmation, :current_password)
  end
end