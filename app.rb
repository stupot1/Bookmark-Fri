# frozen_string_literal: true
require 'sinatra/base'
require './lib/bookmarks.rb'

class App < Sinatra::Base
  get '/' do
  erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.new.all
    erb :bookmarks
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
