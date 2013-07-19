require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  context "#create" do 
     setup do
        @blog_entry = BlogEntry.create :title => 'foo', :body => 'bar'
      end

    should "create a comment" do
      assert_difference("Comment.count", +1 ) do 
        post :create, { blog_entry_id: @blog_entry.id, comment: {body: "me", commenter: "you"} }
      end
    end

    should "redirect back to blog_entry" do
      post :create, { blog_entry_id: @blog_entry.id, comment: {body: "me", commenter: "you"} }
      assert_redirected_to blog_entry_path @blog_entry 
    end
  end

  context "#destroy" do
    setup do
      @blog_entry = BlogEntry.create :title => 'foo', :body => 'bar'
      @blog_entry.comments.create( body: "helloworld", commenter: "foo")
    end

    should "delete a comment" do
      assert_difference("@blog_entry.comments.count", -1) do
        delete :destroy, { blog_entry_id: @blog_entry.id, id: @blog_entry.comments.last.id }
      end
      assert BlogEntry.find_by_id(@blog_entry.id).comments.last.nil?
    end

    should "redirect to blog_entries" do
      delete :destroy, { blog_entry_id: @blog_entry.id, id: @blog_entry.comments.last.id }
      
      assert_redirected_to blog_entry_path @blog_entry.id
    end
  end

end
