require 'test_helper'

class BlogEntriesControllerTest < ActionController::TestCase
  context "#index" do
    should "respond successfully" do
      get :index

      assert_response 200
    end
  end

  context "#show" do
    should "respond with a 404" do
      get :show, :id => 'asdfiquwefiou ioawefuio83uf 8389f 3j89f 893 fj893 jf893 j'

      assert_response 404
    end

    context "with a blog entry" do
      setup do
        @blog_entry = BlogEntry.create :title => 'foo', :body => 'bar'
      end

      should "respond successfully" do
        get :show, :id => @blog_entry.id

        assert_response 200
      end
    end
  end
end

