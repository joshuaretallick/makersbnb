require 'sinatra/base'
# require 'sinatra-flash'


class Makersbnb < Sinatra::Base
  get '/' do
  'Hello World'
end

run! if app_file == $0
end
