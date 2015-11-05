require 'data_mapper'

require './app/models/link'
require './app/models/tag'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bmanager_#{ENV['RACK_ENV']}")
DataMapper.finalize
