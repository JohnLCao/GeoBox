class FixMessageRoomProperty < ActiveRecord::Migration
  def change
  	rename_column :messages, :room, :room_id
  end
end
