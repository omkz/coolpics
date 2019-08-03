class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    # Require current password if user is trying to change password.
    return super if params["password"]&.present?

    # Allows user to update registration information without password.
    resource.update_without_password(params.except("current_password"))
  end
  
  private

  def sign_up_params
    params.require(:user).permit(:avatar, :username, :firstname, :lastname, :bio, :location, :birthday, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:avatar, :username, :firstname, :lastname, :email, :bio, :location, :birthday, :password, :password_confirmation, :current_password)
  end
end