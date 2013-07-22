require 'test_helper'

class UsersControllerTest < ActionController::TestCase
   context "#new" do
    should "render ok" do
      # you write this one
    end
   end

   context "#create" do
    should "create a user account" do
      assert_difference("User.count", 1) do
        post :create, :user => {:login => 'josh', :password => 'secret'}
      end

      assert User.find_by_login('josh').present?
      assert_redirected_to root_path
    end

    should "not create an account when fields are blank" do
      # you write this
    end
   end

end
