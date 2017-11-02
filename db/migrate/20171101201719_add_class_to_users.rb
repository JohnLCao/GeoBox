class AddClassToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_class, :string, default: "regular"
  end
end
