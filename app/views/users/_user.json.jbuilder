json.extract! user, :id, :user_name, :email, :password, :real_name, :gender, :phone, :address, :created_at, :updated_at
json.url user_url(user, format: :json)
