require 'pg'

p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_test')

  connection.exec("TRUNCATE users, property;")
end
