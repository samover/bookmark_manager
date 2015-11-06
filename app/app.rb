ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup'


class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end
  
  get '/signup' do
    erb :signup
  end
  
  post '/signup/new' do
    user = User.create(username: params[:username],
                    email: params[:email],
                    password: params[:password] )
    session[:username] = params[:username]
    redirect '/welcome'
  end
  
  get '/welcome' do
    @username = session[:username] 
    erb :welcome
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
    tagz = params[:tag].split(', ')
    tagz.each{ |tag| link.tags << Tag.first_or_create(name: tag) }
    link.save
    redirect('/links')
  end

  post '/tags' do
    redirect "tags/#{params[:name]}"
  end

  get '/tags/:name' do
    tag = Tag.all(name: params[:name])
    @link = tag ? tag.links : []
    erb :tags
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
