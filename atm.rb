# frozen_string_literal: true

module DataModels
  class Atm
    attr_reader :available_cash

    def initialize(available_cash)
      @available_cash = available_cash
    end

    def to_json(*_args)
      { available_cash: @available_cash }.to_json
    end
  end
end
