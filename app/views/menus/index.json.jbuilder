json.array!(@menus) do |menu|
  json.extract! menu, :id, :category, :name, :description, :price, :photo
  json.url menu_url(menu, format: :json)
end
