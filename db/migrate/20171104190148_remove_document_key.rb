class RemoveDocumentKey < ActiveRecord::Migration
  def change
    remove_column :documents, :cloudKey
  end
end
