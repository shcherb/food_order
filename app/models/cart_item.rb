class CartItem < ActiveRecord::Base
  belongs_to :menu
  belongs_to :cart
  validates :name, presence: true
end
