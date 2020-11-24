require 'property'

describe Property do

# As a User (Landlord?)
# In order to hire out my space
# I want to list a new space with a name, description and price per night.
  describe "#create" do
    it "allows the user to create a property listing" do
      new = Property.create(name: "house", description: "small, 3 rooms", cost: 50)
        expect(new.name).to eq "house"
        expect(new.description).to eq "small, 3 rooms"
        expect(new.cost).to eq 50
        expect(new).to be_a Property
    end
  end


end
