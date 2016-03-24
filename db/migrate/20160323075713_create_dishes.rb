class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.belongs_to :category, index: true
      t.string :name
      t.text :description
      t.decimal :price
      t.string :photo
      t.timestamps null: false
    end
  end
end
