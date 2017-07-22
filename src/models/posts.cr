require "granite_orm/adapter/pg"

class Posts < Granite::ORM 
  adapter pg

  # id : Int64 primary key is created for you
  field title : String
  field body : String
  timestamps
end
