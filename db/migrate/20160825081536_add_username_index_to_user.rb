class AddUsernameIndexToUser < ActiveRecord::Migration[6.0]
  def change
  	add_index :users, :username, unique: true
  	change_column :users, :username, :string, unique: true, null: false
  end
end
