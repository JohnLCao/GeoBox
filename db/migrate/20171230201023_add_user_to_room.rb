class AddUserToRoom < ActiveRecord::Migration
  def change
  	add_column :rooms, :user_id, :integer, default: nil;
  end
end
