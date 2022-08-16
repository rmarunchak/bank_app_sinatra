require './server'

module DataModels
  class Client
    attr_reader :first_name, :last_name, :balance
    def initialize(first_name, last_name, balance)
      @first_name = first_name
      @last_name = last_name
      @balance   = balance
    end
  end
end