require 'sinatra/base'
require_relative './database_connection_setup.rb'
require './lib/property.rb'
# require 'sinatra-flash'


class Makersbnb < Sinatra::Base

  get '/' do
    erb :'signup'
  end

  post '/' do
    User.create(email: params[:email], password: params[:password])
    redirect '/property'
  end

  get '/property' do
    'Welcome to Makersbnb'
    @properties = Property.all
    erb :'property/index'
  end

run! if app_file == $0
end
