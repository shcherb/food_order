json.array!(@dishes) do |dish|
  json.extract! dish, :id, :name, :description, :price, :category_id
  json.category_name dish.category.name
  json.url dish_url(dish, format: :json)
end
