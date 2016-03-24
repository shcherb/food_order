class CartItem < ActiveRecord::Base
  belongs_to :cart
  validates :name, presence: true
end
