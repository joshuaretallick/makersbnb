require 'sinatra/base'
require_relative './database_connection_setup.rb'
# require 'sinatra-flash'


class Makersbnb < Sinatra::Base
  get '/' do
  'Hello World'
end

run! if app_file == $0
end
