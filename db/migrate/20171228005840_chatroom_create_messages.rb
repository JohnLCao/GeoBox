# encoding: utf-8
class ChatroomCreateMessages < ActiveRecord::Migration
	def change
		create_table(:messages) do |t|
			t.text :content, :null => false

			
			t.timestamps
		end
	end
end
