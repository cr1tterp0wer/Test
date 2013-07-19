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

  context "#destroy" do
    should "respond with a 404" do
      delete :destroy, :id => 'asdfiquwefiou ioawefuio83uf 8389f 3j89f 893 fj893 jf893'
      assert_response 404
    end

    context "with a blog entry" do
      setup do
        @blog_entry = BlogEntry.create :title => 'foo', :body => 'bar'
      end

      should "delete the blog entry" do
        assert_difference("BlogEntry.count", -1) do
          delete :destroy, :id => @blog_entry.id
        end

        assert BlogEntry.find_by_id(@blog_entry.id).nil?
      end

      should "redirect back to #index" do
        delete :destroy, :id => @blog_entry.id
        assert_redirected_to blog_entries_path
      end
    end
  end

  context "#create" do     
    should "create a blog entry and redirect to #show" do
      assert_difference("BlogEntry.count", +1) do
        post :create, :blog_entry => {:title => "hhh", :body => "rrr" }    
      end

      assert_redirected_to blog_entry_path(BlogEntry.last.id)
    end
  end

  context "#new" do
    should "render correctly" do
      get :new 
      assert_response 200
    end
  end

  context "#update" do
    should "render correctly" do

      assert_response 200
    end
  end
end


