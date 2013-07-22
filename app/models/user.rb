class User < ActiveRecord::Base
  attr_accessible :login, :password_digest
  validates :login, presence: true
  validates :password_digest, presence: true
end
