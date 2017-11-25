class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :key
      t.text :description
      t.string :latitude
      t.string :longitude
      t.integer :user

      t.timestamps null: false
    end
  end
end
