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
                    password: params[:password],
                    password_confirmation: params[:password_confirmation] )

    session[:user_id] = user.id
    user.valid? ? (redirect '/links') : (redirect '/error')
  end

  get '/links' do
    @link = Link.all
    erb :links
  end
  get '/error' do
    erb :error
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

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
