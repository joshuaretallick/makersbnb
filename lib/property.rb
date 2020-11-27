require_relative 'database_connection'
require_relative 'user'

class Property

  attr_reader :id, :name, :description, :cost, :user_id, :christmas_week


  def initialize(id:, name:, description:, cost:, user_id:, christmas_week:)
    @id = id
    @name = name
    @description = description
    @cost = cost
    @user_id = user_id
    @christmas_week = christmas_week
  end

  def self.create(name:, description:, cost:, user_id:)
    result = DatabaseConnection.query("INSERT INTO property (name, description, cost, user_id) VALUES('#{name}', '#{description}', '#{cost}', '#{user_id}') RETURNING id, name, description, cost, user_id, christmas_week")
    Property.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], cost: result[0]['cost'].to_i, user_id: result[0]['user_id'], christmas_week: true)
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM property WHERE christmas_week = true")
    result.map do
      |property| Property.new(id: property['id'], name: property['name'], description: property['description'], cost: property['cost'].to_i, user_id: property['user_id'], christmas_week: true)
    end
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM property WHERE id=#{id};")
    Property.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], cost: result[0]['cost'].to_i, user_id: result[0]['user_id'], christmas_week: true)
  end

  def self.availability(id:)
    result = DatabaseConnection.query("UPDATE property SET christmas_week = false WHERE id = '#{id}' RETURNING id, name, description, cost, user_id, christmas_week")
    Property.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], cost: result[0]['cost'].to_i, user_id: result[0]['user_id'], christmas_week: result[0]['christmas_week'] )
  end

end
