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

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(email: 'test@example.com', password: 'password123')
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')
      expect(authenticated_user.id).to eq user.id
    end
  end

  # describe '.find' do
  #   it 'finds a user by ID' do
  #     user = User.create(email: 'test@example.com', password: 'password123')
  #     result = User.find(id: user.id)
  #     expect(result.id).to eq user.id
  #     expect(result.email).to eq user.email
  #   end
  #
  #   it 'returns nil if there is no ID given' do
  #     expect(User.find(id: nil)).to eq nil
  #   end
  # end


end
