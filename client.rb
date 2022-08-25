module DataModels
  class Client
    attr_reader :first_name, :last_name, :balance
    def initialize(first_name, last_name, balance)
      @first_name = first_name
      @last_name = last_name
      @balance   = balance
    end

    def to_json
      {first_name: @first_name, last_name: @last_name, balance: @balance}.to_json
    end
  end
end
