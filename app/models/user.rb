require "bcrypt"

class User < ActiveRecord::Base
  include BCrypt

  attr_accessible :login, :password
  validates :login, presence: true
  validates :password_digest, presence: true

  def password=(str)
    if str.present?
      self.password_digest = Password.create(str).to_s
    end
  end

  def password
    if(password_digest != nil)
      @password ||= Password.new(self.password_digest)
    end
  end
end
