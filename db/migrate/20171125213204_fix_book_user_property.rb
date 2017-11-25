class FixBookUserProperty < ActiveRecord::Migration
  def change
  	rename_column :books, :user, :user_id
  end
end
