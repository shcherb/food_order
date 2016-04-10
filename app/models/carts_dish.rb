class CartsDish < ActiveRecord::Base
  belongs_to :cart
  belongs_to :dish
end
