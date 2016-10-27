class Notification < ApplicationRecord
  after_create_commit { NotificationBroadcastJob.perform_later self }

  belongs_to :recipent, class_name: "User"
  belongs_to :sender, class_name: "User"

end
