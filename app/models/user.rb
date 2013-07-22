class User < ActiveRecord::Base
  attr_accessible :login, :password_digest
  validates :login, presence: true
  validates :password_digest, presence: true

  def password=(str)
  end

  def hash(str)
    BCrypt::Password.create(self.seed + str)
  end

  private
  def seed
    "lkjvneioonvclkljk12394-fuzzy-pickles-ka-ching!"
  end
end
