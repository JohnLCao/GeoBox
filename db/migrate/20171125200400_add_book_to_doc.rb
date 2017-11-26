class AddBookToDoc < ActiveRecord::Migration
  def change
    add_column :documents, :book, :integer, default: nil
  end
end
