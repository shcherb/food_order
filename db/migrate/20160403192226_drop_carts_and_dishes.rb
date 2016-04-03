class DropCartsAndDishes < ActiveRecord::Migration
  def change
    drop_table :carts_and_dishes
  end
end
