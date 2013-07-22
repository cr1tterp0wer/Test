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
end
