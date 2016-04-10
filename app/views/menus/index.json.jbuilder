json.array!(@menus) do |menu|
  json.extract! menu, :id, :name
  json.menu_for_url menu.url
  json.url_json menu_url(menu, format: :json)
end
