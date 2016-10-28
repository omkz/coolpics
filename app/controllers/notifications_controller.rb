class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(recipent: current_user).reverse
  end
end
