Rails.application.routes.draw do

 get "/api/v1/users/:user_id/conversations", to: "api/v1/users/conversations#index", format: :json

 get "/api/v1/users/:user_one_id/users/:user_two_id/messages", to: "api/v1/users/users/messages#index", format: :json

post "/api/v1/users/:user_one_id/users/:user_two_id/messages", to: "api/v1/users/users/messages#create", format: :json


end
