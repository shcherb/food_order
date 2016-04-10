json.array!(@cart.dishes) do |dish|
  json.extract! dish, :id, :name, :price
  json.count dish_count(dish.id)
  json.sum dish_sum(dish)
end
