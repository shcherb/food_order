# == Schema Information
#
# Table name: carts_dishes
#
#  id      :integer          not null, primary key
#  cart_id :integer
#  dish_id :integer
#

class CartsDish < ActiveRecord::Base
  belongs_to :cart
  belongs_to :dish
end
