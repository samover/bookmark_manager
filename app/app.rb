require 'sinatra/base'
require './app/models/link'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/links' do
    @link = Link.all
    erb :links
  end

  get '/create_link' do
    erb :create_link
  end

  post '/add_bookmark' do
    redirect('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
