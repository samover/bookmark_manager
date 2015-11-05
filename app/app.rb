ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup'


class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/links' do
    @link = Link.all
    erb :links
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(name: params[:tag])
    link.tags << tag
    link.save
    redirect('/links')
  end
  
  get '/tags/:name' do
    tag = Tag.all(name: params[:name])
    @link = tag ? tag.links : []
    erb :tags
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
