require_relative '../server'
require_relative 'relatives'

def get_body(request)
  JSON.parse(request.body.read)
end

def new_client
  Factory.create_client(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    balance: Faker::Number.number(digits: 5)
  )
end

def new_atm
  Factory.create_atm(available_cash: Faker::Number.number(digits: 5))
end

