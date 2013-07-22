class User < ActiveRecord::Base
  attr_accessible :login, :password_digest
end
