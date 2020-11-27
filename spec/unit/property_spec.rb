require 'property'
require 'user'

describe Property do

  describe ".create" do
    it "allows the user to create a property listing" do
      user = User.create(email: 'test@test.com', password: 'password')
      new = Property.create(name: "house", description: "small, 3 rooms", cost: 50, user_id: user.id)
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
      user = User.create(email: 'test@test.com', password: 'password')
      property = Property.create(name: "house", description: "small, 3 rooms", cost: 50, user_id: user.id)
      Property.create(name: "castle", description: "big, cold, stoney", cost: 200, user_id: user.id)
      Property.create(name: "tent", description: "Intense", cost: 25, user_id: user.id)

      properties = Property.all

      expect(properties.first.name).to eq "house"
      expect(properties.first).to be_a Property
      expect(properties.first.description).to eq "small, 3 rooms"
      expect(properties.first.cost).to eq 50
      expect(properties.first.id).to eq property.id
    end
  end

  describe '.find' do
  it 'returns the requested property object' do
    user = User.create(email: 'test@test.com', password: 'password')
    property = Property.create(name: "house", description: "small, 3 rooms", cost: 50, user_id: user.id)

    result = Property.find(id: property.id)

    expect(result).to be_a Property
    expect(result.id).to eq property.id
    expect(result.name).to eq 'house'
    expect(result.description).to eq 'small, 3 rooms'
    expect(result.cost).to eq 50
    end
  end

  describe '.availability' do
  it 'changes the availabiltiy from true to false when booking created' do
    host_user = User.create(email: 'test@test.com', password: 'password')
    renter = User.create(email: 'test2@test.com', password: 'password')
    property = Property.create(name: "house", description: "small, 3 rooms", cost: 50, user_id: host_user.id)
    result = Property.availability(id: property.id)
    expect(result.christmas_week).to eq "f"
    end
  end



end
