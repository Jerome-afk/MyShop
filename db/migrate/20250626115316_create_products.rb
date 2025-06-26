class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :brand
      t.string :model
      t.text :description
      t.string :condition
      t.string :finish
      t.decimal :price
      t.string :color
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
