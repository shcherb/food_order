class Dish < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :menus, dependent: :destroy
  has_and_belongs_to_many :carts, dependent: :destroy
end
