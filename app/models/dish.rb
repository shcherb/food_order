class Dish < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :menus, dependent: :destroy
  has_many :carts_dishes
  has_many :carts, through: :carts_dishes, dependent: :destroy
end
