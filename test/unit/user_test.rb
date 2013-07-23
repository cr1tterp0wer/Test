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
      u.login = "foo"
      u.password = "it's a secret"
      u.save!

      u = User.find(u.id)
      assert u.password == "it's a secret"
    end
  end

  should "create a new accout" do
    u = User.new( { :login => "foo", :password => "bar" } )
    assert u.save
  end

  should "be nil when password_digest is nil" do
    u = User.new

    assert u.password == nil

  end

end
