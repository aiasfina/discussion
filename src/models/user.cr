require "secure_random"
require "crypto/bcrypt"
require "granite_orm/adapter/pg"

class User < Granite::ORM 
  adapter pg

  # id : Int64 primary key is created for you
  field name : String
  field email : String
  field salted_password : String
  field salt : String
  field remember_me_token : String
  timestamps

  def self.create_one(name : String, email : String, password : String)
    user = User.new
    user.name = name
    user.email = email
    user.salt = generate_salt
    user.salted_password = encrypt_password(password, user.salt)
    user.save
    user
  end

  def self.login_from_user(email : String, password : String)
    user = find_by :email, email
    if user
      if user.salted_password == encrypt_password(password, user.salt)
        return user
      end
    end
  end

  def self.encrypt_password(password : String, salt : String | Nil)
    salt = salt.as(String)
    Crypto::Bcrypt.new(password, salt).to_s
  end

  def self.generate_salt(n = 16)
    SecureRandom.hex(n)
  end
end
