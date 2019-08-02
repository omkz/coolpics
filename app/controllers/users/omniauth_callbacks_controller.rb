class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.create_from_facebook_data(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      set_flash_message(:notice, :alert, :kind => "There was a problem signing you in through Facebook. Please register or try signing in later.") if is_navigational_format?
      redirect_to new_user_registration_url
    end
  end

  def twitter
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.create_from_twitter_data(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      set_flash_message(:notice, :alert, :kind => "There was a problem signing you in through Twitter. Please register or try signing in later.") if is_navigational_format?
      redirect_to new_user_registration_url
    end
  end

  # google callback
  def google_oauth2
    @user = User.create_from_google_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      set_flash_message(:notice, :alert, :kind => "There was a problem signing you in through Google. Please register or try signing in later.") if is_navigational_format?
      redirect_to new_user_registration_url
    end 
  end

  def failure
    redirect_to root_path
  end
end