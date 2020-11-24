require_relative 'database_connection'

class Property

  attr_reader :id, :name, :description, :cost


  def initialize(id:, name:, description:, cost:)
    @id = id
    @name = name
    @description = description
    @cost = cost
  end

  def self.create(name:, description:, cost:)
    result = DatabaseConnection.query("INSERT INTO property (name, description, cost) VALUES('#{name}', '#{description}', '#{cost}') RETURNING id, name, description, cost")
    Property.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], cost: result[0]['cost'].to_i)
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM property")
    result.map do
      |property| Property.new(id: property['id'], name: property['name'], description: property['description'], cost: property['cost'].to_i)
    end
  end

end
