require_relative 'server'
require_relative 'client'
require_relative 'atm'

module Factory
  def self.create_client(args)
    DataModels::Client.new(args[:first_name],
                           args[:last_name],
                           args[:balance]).generate_json
  end

  def self.create_atm(args)
    DataModels::Atm.new(args[:available_cash]).generate_json
  end
end
