require 'test_helper'

class BlogEntryTest < ActiveSupport::TestCase
  context "#mashify!" do
    setup do
      @blog_entry = BlogEntry.new
      @blog_entry.body = "mash"
    end

    should "look like the mash logo" do
      @blog_entry.body = "mash"
      @blog_entry.mashify_title = true;

      assert_equal "M*A*S*H", @blog_entry.mashify!
    end

    should "remove whitespace" do
      @blog_entry.body = "        mash         "
      @blog_entry.mashify_title = true

      assert_equal "M*A*S*H", @blog_entry.mashify!
    end

    should "remove all *'s when not checked" do
      @blog_entry.body = "M*A*S*H"
      @blog_entry.mashify_title = false

      assert_equal "mash", @blog_entry.mashify!
    end
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

    should "Remove all -'s When not checked" do
      @blog_entry.body = "F-O-O"
      @blog_entry.dashify_title = false
      
      assert_equal "foo", @blog_entry.dashify!
    end
  end

  context '#mash_dash!' do
    setup do
      @blog_entry = BlogEntry.new
    end

    should "call mashify! and dashify!" do 
      @blog_entry.body = "foo bar"
      @blog_entry.dashify_title = true;
      @blog_entry.mashify_title = true;

      assert_equal "F*-*O*-*O*-* *-*B*-*A*-*R", @blog_entry.mash_dash!
    end

    should "remove both *'s and -'s" do 
      @blog_entry.body = "F*-*O*-*O*-* *-*B*-*A*-*R"
      @blog_entry.dashify_title = false;
      @blog_entry.mashify_title = false;

      assert_equal "foo bar", @blog_entry.mash_dash!
    end
  end
end









