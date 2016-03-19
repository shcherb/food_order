json.array!(@users) do |user|
  json.extract! user, :id, :email, :phone, :passwd
  json.url user_url(user, format: :json)
end
