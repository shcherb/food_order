module OrderHelper
  def is_in_cart?(dish_id)
    if(dish_count(dish_id)>0;false;true)
  end
  end

  def dish_count(dish_id)
    @cart.dishes.where('dish_id = ?',dish_id).count
  end
end
