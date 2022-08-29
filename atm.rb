# frozen_string_literal: true

module DataModels
  class Atm
    attr_reader :available_cash

    def initialize(available_cash)
      @available_cash = available_cash
    end

    def generate_json
      { available_cash: @available_cash }.to_json
    end
  end
end
