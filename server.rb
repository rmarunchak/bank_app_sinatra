require 'sinatra'
require 'json'
require 'faker'
require_relative 'helpers/relatives'
require_relative 'helpers/helpers'


clients = []
atm = []

get '/clients' do
  clients.to_json
end

get '/generate_client' do
  @new_client = new_client.to_json
  clients.push(@new_client)
  clients.to_json
end

get '/clients/:id' do
  id = params['id'].to_i
  clients[id].to_json
end

post '/clients' do
  body = get_body(request)
  new_client = { first_name: body['first_name'], last_name: body['last_name'], balance: body['balance'] }
  clients.push(new_client)
  new_client.to_json
end

put '/clients/:id' do
  id = params['id'].to_i
  body = get_body(request)
  clients[id][:first_name] = body['first_name']
  clients[id][:last_name] = body['last_name']
  clients[id][:balance] = body['balance']
  clients[id].to_json
end

delete '/clients/:id' do
  id = params['id'].to_i
  client = clients.delete_at(id)
  client.to_json
end

get '/atm' do
  atm.to_json
end

get '/generate_atm' do
  @new_atm = new_atm.to_json
  atm.push(@new_atm)
  atm.to_json
end


