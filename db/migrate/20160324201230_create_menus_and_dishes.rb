class CreateMenusAndDishes < ActiveRecord::Migration
  def change
    create_table :dishes_menus do |t|
      t.belongs_to :menu, index: true
      t.belongs_to :dish, index: true
    end
  end
end
