class CreateCartsDishes < ActiveRecord::Migration
  def change
    create_table :carts_dishes do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :dish, index: true
    end
  end
end
