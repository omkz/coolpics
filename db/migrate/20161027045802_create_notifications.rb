class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :recipent_id
      t.integer :sender_id
      t.string :message
      t.boolean :is_read

      t.timestamps
    end
  end
end
