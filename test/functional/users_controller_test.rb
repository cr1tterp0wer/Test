require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  context "#new" do
    should "render ok" do
      post :new,  :user => {login: 'josh', password_digest: 'secret' }

      assert_response 200
    end
  end

  context "#create" do
    should "create a user account" do
      assert_difference("User.count", +1) do
        post :create, :user => {:login => 'josh', :password => 'secret'}
    
        assert User.find_by_login('josh').present?
        assert_redirected_to root_path
      end
    end

    should "not create an account when fields are blank" do
      assert_difference("User.count", 0) do
        post :create, :user => { :login => "Gremlin", :password_digest => "grrr" }
      end
    end
  end
end
