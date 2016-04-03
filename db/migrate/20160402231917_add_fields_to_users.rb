class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :avatar, :string
    add_column :users, :bio, :string
    add_column :users, :location, :string
    add_column :users, :birthday, :datetime
  end
end
