class AddUserIdToDishes < ActiveRecord::Migration
  def change
    add_belongs_to :dishes, :user, index: true
  end
end
