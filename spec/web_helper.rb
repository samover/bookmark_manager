def initialize_database
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, 'postgres://localhost/bmanager')
  
end

def finalize_database
  DataMapper.finalize
  DataMapper.auto_upgrade!
end
