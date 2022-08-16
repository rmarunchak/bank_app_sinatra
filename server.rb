require 'sinatra'
require './client'

clients = [{ first_name: "John", last_name: "Doe", balance: 0 }]

new_client = Factory.new_client(
  :first_name => "Tom",
  :last_name => "Jerry",
  :balance   => 99
).push(clients)


def get_body(request)
  JSON.parse(request.body.read)
end

get '/clients' do
  clients.to_json
end

get '/clients/:id' do
  id = params["id"].to_i
  clients[id].to_json
end

post '/clients' do
  body = get_body(request)
  new_client = { first_name: body["first_name"], last_name: body["last_name"], balance: body["balance"] }
  clients.push(new_client)
  new_client.to_json
end

put '/clients/:id' do
  id = params["id"].to_i
  body = get_body(request)
  clients[id][:first_name] = body["first_name"]
  clients[id][:last_name] = body["last_name"]
  clients[id][:balance] = body["balance"]
  clients[id].to_json
end

delete '/clients/:id' do
  id = params["id"].to_i
  client = clients.delete_at(id)
  client.to_json
end
