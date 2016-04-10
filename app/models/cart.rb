class Cart < ActiveRecord::Base
  has_many :carts_dishes
  has_many :dishes, through: :carts_dishes
end
