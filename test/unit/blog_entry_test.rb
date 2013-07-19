require 'test_helper'

class BlogEntryTest < ActiveSupport::TestCase
  context "#mashify!" do
    setup do
      @blog_entry = BlogEntry.new
      @blog_entry.body = "mash"
    end

    should "look like the mash logo" do
      @blog_entry.mashify_title = true;
      assert_equal "M*A*S*H", @blog_entry.mashify!
    end

    should "replace * with !" do
      @blog_entry.body = "sh*t"
      @blog_entry.mashify_title = true;
      assert_equal "S*H*!*T", @blog_entry.mashify!
    end

    should "remove whitespace" do
      @blog_entry.body = "        mash         "
      @blog_entry.mashify_title = true
      assert_equal "M*A*S*H", @blog_entry.mashify!
    end

  context '#dashify!' do
    setup do
      @blog_entry = BlogEntry.new
      @blog_entry.body = "foo"
    end

    should "insert - between chars When checked" do
      @blog_entry.body = "foo"
      @blog_entry.dashify_title = true;

  	  assert_equal "F-O-O", @blog_entry.dashify!
    end
    
  end
end 
=begin
    should "Remove all -'s When not checked" do
      @blog_entry.body = "F-O-O"
      @blog_entry.dashify_title = false
      
      assert_equal "foo", @blog_entry.dashify!
    end
  end
end

=begin
      # blog_entry.title = 'f-o'
      #  assert_equal "F-*-O", blog_entry.dashify!



  context '#mash_dash!' do
    blog_entry = BlogEntry.new

    blog_entry.body = "foo"
    assert_equal "F*-*O*-*O", blog_entry.mash_dash!
  end
=end

