require_relative '../spec/spec_helper'

RSpec.describe Factory do
  describe 'object creation' do
    it 'client can be created' do
      user = Factory.create_client(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        balance: Faker::Number.number(digits: 5)
      )
      expect(user).not_to be nil
    end

    it 'atm can be created' do
      atm = Factory.create_atm(
        available_cash: Faker::Number.number(digits: 5)
      )
      expect(atm).not_to be nil
    end
  end
end