require 'dm-validations'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :username, String
  property :email, String, required: true, unique: true
  property :password_hash, Text
  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, :as => :email_address

  def password=(new_password)
    @password = new_password
    self.password_hash = Password.create(new_password)
  end

  def self.authenticate(email, password)
    user = first(email: email)

    if user && Password.new(user.password_hash) == password
      user
    else
     nil
    end
  end
end
