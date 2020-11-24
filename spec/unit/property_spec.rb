require 'property'

describe Property do

# As a User (Landlord?)
# In order to hire out my space
# I want to list a new space with a name, description and price per night.
  describe ".create" do
    it "allows the user to create a property listing" do
      new = Property.create(name: "house", description: "small, 3 rooms", cost: 50)
      persisted_data = PG.connect(dbname: 'makersbnb_test').query("SELECT * FROM property WHERE id = #{new.id};")
        expect(new.name).to eq "house"
        expect(new.description).to eq "small, 3 rooms"
        expect(new.cost).to eq 50
        expect(new).to be_a Property
        expect(new.id).to eq persisted_data.first['id']
    end
  end

  describe '.all' do
    it 'shows all the property listings' do
      property = Property.create(name: "house", description: "small, 3 rooms", cost: 50)
      Property.create(name: "castle", description: "big, cold, stoney", cost: 200)
      Property.create(name: "tent", description: "Intense", cost: 25)

      properties = Property.all

      expect(properties.first.name).to eq "house"
      expect(properties.first).to be_a Property
      expect(properties.first.description).to eq "small, 3 rooms"
      expect(properties.first.cost).to eq 50
      expect(properties.first.id).to eq property.id
    end
  end
end
