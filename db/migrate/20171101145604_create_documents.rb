class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :filename
      t.text :description
      t.string :latitude
      t.string :longitude
      t.string :cloudKey
      t.integer :user

      t.timestamps null: false
    end
  end
end
