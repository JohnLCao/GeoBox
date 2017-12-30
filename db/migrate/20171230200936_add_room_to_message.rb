class AddRoomToMessage < ActiveRecord::Migration
  def change
  	add_column :messages, :room, :integer, default: nil
  end
end
