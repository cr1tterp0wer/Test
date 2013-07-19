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
        @blog_entry.comments.last.delete
      end
      assert BlogEntry.find_by_id(@blog_entry.id).comments.last.nil?
    end

    should "redirect" do
    end
    #should "redirect to blog_entry" do
    # end

    # should delete the comment
    # should redirect back to the blog entry 
  end
end
