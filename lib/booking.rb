require_relative 'user'
require_relative 'property'

class Booking

  attr_reader :id, :property_id, :user_id

  def initialize(id:, property_id:, user_id:)
    @id = id
    @property_id = property_id
    @user_id = user_id
  end

  def self.create(property_id:, user_id:)
    result = DatabaseConnection.query("INSERT INTO booking (property_id, user_id) VALUES('#{property_id}', '#{user_id}') RETURNING id, property_id, user_id")
    DatabaseConnection.query("UPDATE property SET christmas_week = false WHERE id = '#{property_id}'")
    Booking.new(id: result[0]['id'], property_id: result[0]['property_id'], user_id: result[0]['user_id'])
  end

end
