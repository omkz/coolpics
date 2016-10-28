class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    notify(@user, 'follow')
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    notify(@user, 'unfollow')
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def notify(recipent, message)
    Notification.create(recipent: recipent, sender: current_user, message: "A #{message} ki has been created", is_read: false)
  end

end
