class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :menu_id
      t.integer :cart_id

      t.timestamps null: false
    end
  end
end
