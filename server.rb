require 'sinatra'
require 'json'
require 'faker'
require_relative 'helpers/relatives'
require_relative 'helpers/helpers'

clients = File.read('./client_base.json')
atm = []

get '/clients' do
  content_type :json
  clients
end

get '/generate_client' do
  array = []
  @new_client = new_client
  if File.zero?('./client_base.json')
    File.open('./client_base.json', 'a') { |file| file.write((JSON(array.push(JSON(@new_client))))) }
  else
    file_array = File.readlines('./client_base.json')
    File.write('./client_base.json', JSON(file_array.push(JSON(@new_client))))
  end
end

get '/clients/:id' do
  content_type :json
  id = params['id'].to_i
  clients[id]
end

post '/clients' do
  content_type :json
  body = get_body(request)
  new_client = { first_name: body['first_name'], last_name: body['last_name'], balance: body['balance'] }
  File.open('./client_base.json', 'a') { |file| file.write(new_client.to_json) }
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

get '/atm' do
  atm.to_json
end

get '/generate_atm' do
  @new_atm = new_atm.to_json
  atm.push(@new_atm)
  atm.to_json
end


