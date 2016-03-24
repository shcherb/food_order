class Dish < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :menus

  before_destroy :ensure_not_referenced_by_any_cart_item

  private
  def ensure_not_referenced_by_any_cart_item
    if cart_items.empty?
      return true
    else
      errors.add(:base, 'has menu items')
      return false
    end
  end
end
