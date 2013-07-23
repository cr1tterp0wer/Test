require "bcrypt"

class User < ActiveRecord::Base
  include BCrypt

  attr_accessible :login, :password_digest
  validates :login, presence: true
  validates :password_digest, presence: true

  def password=(str)
    self.password_digest = Password.create(str).to_s
  end

  def password
    @password ||= Password.new(self.password_digest)
  end
end
