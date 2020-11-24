require 'sinatra/base'
require_relative './database_connection_setup.rb'
require './lib/user'
require './lib/property'
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
    @properties = Property.all
    erb :'property/index'
  end

  get '/property/new' do
    erb :'property/new'
  end

  post '/property' do
    Property.create(name: params['name'], description: params['description'], cost: params['cost'])
    redirect '/property'
  end

run! if app_file == $0
end
