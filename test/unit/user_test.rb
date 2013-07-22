require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context "Validations" do
    should "require a login" do
      u = User.new
      u.valid?
      assert u.errors[:login].present?
    end

    should "require a password_digest" do
      u = User.new
      u.valid?
      assert u.errors[:password_digest].present?
    end
  end

  context "#password=" do
    should "generate a secure hash for the user" do
      u = User.new
      u.password = "it's a secret"

      assert !u.password_digest.nil?
      assert_not_equal "it's a secret", u.password_digest
      assert u.password.nil?
      assert_equal "$2a$10$Zq9yalZd2YMeaVrgxJKy8Ot5ZFjT2MVkSEKlThQdk5bqH3/pYdNju", u.password_digest
    end
  end
end
