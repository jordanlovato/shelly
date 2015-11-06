json.array!(@shelly_users) do |shelly_user|
  json.extract! shelly_user, :id, :first_name, :last_name, :username, :password_encrypted, :email, :description, :activated
  json.url shelly_user_url(shelly_user, format: :json)
end
