require 'user'
require 'pg'

describe User do
  describe '.create' do
    it 'creates a new user profile' do
      user = User.create(email: 'test@test.com', password: 'password')

      expect(user).to be_a User
      #expect(user.id).to eq result.first['id']
      expect(user.email).to eq 'test@test.com'
    end
  end


end
