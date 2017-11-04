class FixDocUserProperty < ActiveRecord::Migration
  def change
    rename_column :documents, :user, :user_id
  end
end
