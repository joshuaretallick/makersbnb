require 'booking'
require 'property'
require 'user'

describe Booking do

  describe ".create" do
    it "allows the user to create a booking" do
      user = User.create(email: 'test@test.com', password: 'password')
      property = Property.create(name: "house", description: "small, 3 rooms", cost: 50, user_id: user.id)
      booking = Booking.create(property_id: property.id, user_id: user.id)
      persisted_data = PG.connect(dbname: 'makersbnb_test').query("SELECT * FROM booking WHERE id = #{booking.id};")
      expect(booking).to be_a Booking
      expect(booking.id).to eq persisted_data.first['id']
    end
  end

end
