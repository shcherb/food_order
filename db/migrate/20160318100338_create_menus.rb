class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :category
      t.string :name
      t.text :description
      t.decimal :price
      t.string :photo
      t.string :url

      t.timestamps null: false
    end
  end
end
