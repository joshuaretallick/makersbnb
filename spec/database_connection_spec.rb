require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')

      DatabaseConnection.setup('makersbnb_test')
    end

    it 'this connection is persistent' do
      # Grab the connection as a return value from the .setup method
        connection = DatabaseConnection.setup('makersbnb_test')

        expect(DatabaseConnection.connection).to eq connection
    end

  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('makersbnb_test')

      expect(connection).to receive(:exec).with("SELECT * FROM users;")
      expect(connection).to receive(:exec).with("SELECT * FROM property;")

      DatabaseConnection.query("SELECT * FROM users;")
      DatabaseConnection.query("SELECT * FROM property;")
    end
  end

end
