require 'test_helper'

class BlogEntryTest < ActiveSupport::TestCase
  context "#mashify!" do
    setup do
      @blog_entry = BlogEntry.new
      @blog_entry.title = "mash"
    end

    should "look like the mash logo" 
      assert_equal "M*A*S*H", @blog_entry.mashify!
    end

    should "replace * with !" do
      @blog_entry.title = "sh*t"
      assert_equal "S*H*!*T", @blog_entry.mashify!
    end

    should "remove whitespace" do
      @blog_entry.title = "        mash         "
      assert_equal "M*A*S*H", @blog_entry.mashify!
    end
  end

  test '#dashify!' do
	  blog_entry = BlogEntry.new

	  blog_entry.title = "foo"
	  assert_equal "F-O-O", blog_entry.dashify!

	  blog_entry.title = 'f-o'
	  assert_equal "F-*-O", blog_entry.dashify!
  end
end
