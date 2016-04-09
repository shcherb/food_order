json.array!(@menus) do |menu|
  json.extract! menu, :id, :name, :url
  json.url menu_url(menu, format: :json)
end
