require_relative 'database_connection'
require_relative 'user'

class Property

  attr_reader :id, :name, :description, :cost, :user_id, :christmas_week


  def initialize(id:, name:, description:, cost:, user_id:)
    @id = id
    @name = name
    @description = description
    @cost = cost
    @user_id = user_id
  end

  def self.create(name:, description:, cost:, user_id:)
    result = DatabaseConnection.query("INSERT INTO property (name, description, cost, user_id) VALUES('#{name}', '#{description}', '#{cost}', '#{user_id}') RETURNING id, name, description, cost, user_id")
    Property.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], cost: result[0]['cost'].to_i, user_id: result[0]['user_id'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM property")
    result.map do
      |property| Property.new(id: property['id'], name: property['name'], description: property['description'], cost: property['cost'].to_i, user_id: property['user_id'])
    end
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM property WHERE id=#{id};")
    Property.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], cost: result[0]['cost'].to_i, user_id: result[0]['user_id'])
  end

end
