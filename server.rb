require 'sinatra'
require 'json'
require 'faker'
require_relative 'helpers/relatives'
require_relative 'helpers/helpers'
require 'pry'

clients = File.read('./client_base.json')
atm = []

get '/clients' do
  content_type :json
  clients
end

get '/generate_client' do
  @new_client = JSON(new_client)
  if File.zero?('./client_base.json')
    file = File.open('./client_base.json', 'w+')
    file.write(JSON([@new_client]))
  else
    file = File.open('./client_base.json', 'r+')
    users = JSON(file.read)
    users << @new_client
    file = File.open('./client_base.json', 'w+')
    file.write(JSON(users))
  end
  file.close
end

get '/clients/:id' do
  content_type :json
  file = File.open('./client_base.json', 'r+')
  users = JSON(file.read)
  id = params['id'].to_i
  JSON(users[id])
end

post '/clients' do
  content_type :json
  body = get_body(request)
  new_client =  { first_name: body['first_name'], last_name: body['last_name'], balance: body['balance'] }
  file = File.open('./client_base.json', 'r+')
  users = JSON(file.read)
  users << JSON(new_client.to_json)
  file = File.open('./client_base.json', 'w+')
  file.write(JSON(users))
  file.close
end

put '/clients/:id' do
  id = params['id'].to_i
  content_type :json
  body = get_body(request)
  new_client = { first_name: body['first_name'], last_name: body['last_name'], balance: body['balance'] }
  file = File.open('./client_base.json', 'r+')
  users = JSON(file.read)
  (users[id]).replace(JSON(new_client.to_json))
  file = File.open('./client_base.json', 'w+')
  file.write(JSON(users))
  file.close
end

get '/atm' do
  atm.to_json
end

get '/generate_atm' do
  @new_atm = new_atm.to_json
  atm.push(@new_atm)
  atm.to_json
end

get '/select_withdraw_user/:id' do |user|
  @user = user
end

get '/select_withdraw_amount/:amount' do |amount|
  @amount = amount
  puts amount
end

put '/withdraw' do
  id = @user


end







