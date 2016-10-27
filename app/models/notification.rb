class Notification < ApplicationRecord
  belongs_to :recipent_id, class_name: "User"
  belongs_to :sender_id, class_name: "User"

  after_create_commit { EventBroadcastJob.perform_later self }

end
