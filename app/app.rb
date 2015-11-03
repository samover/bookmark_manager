require 'sinatra/base'
require './app/models/link'

class BookmarkManager < Sinatra::Base
  get '/' do
    @link = Link.all(url: 'www.google.co.uk')
    erb :index
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
