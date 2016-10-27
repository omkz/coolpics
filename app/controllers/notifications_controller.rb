class NotificationsController < ApplicationController
  def index
    @notifications = Notifications.all.reverse
  end
end
