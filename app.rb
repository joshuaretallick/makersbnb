require 'sinatra/base'
require_relative './database_connection_setup.rb'
require './lib/user'
require './lib/property'
require 'sinatra/flash'
require 'uri'


class Makersbnb < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

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

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    session[:user_id] = User.authenticate(email: params[:email], password: params[:password])
    redirect('/property')
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have successfully signed out'
    redirect('/')
  end
  #START FROM HERE






run! if app_file == $0
end
