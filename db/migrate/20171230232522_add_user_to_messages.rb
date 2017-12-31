class AddUserToMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :username, :string, default: nil;
  end
end
