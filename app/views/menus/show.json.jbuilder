json.array!(@menu.dishes) do |dish|
  json.extract! dish, :id, :name, :description, :price, :category_id
  json.category_name dish.category.name
end
