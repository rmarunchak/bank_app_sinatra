require './server'

module Factory
  def self.new_client(args)
    DataModels::Client.new(args[:first_name],
                           args[:last_name],
                           args[:balance])
  end
end