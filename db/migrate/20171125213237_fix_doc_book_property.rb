class FixDocBookProperty < ActiveRecord::Migration
  def change
  	rename_column :documents, :book, :book_id
  end
end
