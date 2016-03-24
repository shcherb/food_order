class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :url
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
