class CartsDish < ActiveRecord::Base
  belongs_to :carts
  belongs_to :dishes
end
