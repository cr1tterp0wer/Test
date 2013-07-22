require 'test_helper'

class BlogEntryTest < ActiveSupport::TestCase
  context "#mashify" do
    setup do
      @blog_entry = BlogEntry.new
    end

    should "look like the mash logo" do
      assert_equal "M*A*S*H", @blog_entry.mashify("mash")
    end

    should "remove whitespace" do
      assert_equal "M*A*S*H", @blog_entry.mashify("  mash  ")
    end
  end

  context '#dashify' do
    setup do
      @blog_entry = BlogEntry.new
    end

    should "insert - between chars When checked" do
  	  assert_equal "F-O-O", @blog_entry.dashify("foo")
    end
  end

  context '#formatted_title' do
    setup do
      @blog_entry = BlogEntry.new
      @blog_entry.title = 'foo bar'
      @blog_entry.mashify_title = true
      @blog_entry.dashify_title = true
    end

    should "call mashify! and dashify!" do
      assert_equal "F-*-O-*-O-*- -*-B-*-A-*-R", @blog_entry.formatted_title
    end

    should "not modify the title" do
      assert_equal "F-*-O-*-O-*- -*-B-*-A-*-R", @blog_entry.formatted_title
      assert_equal 'foo bar', @blog_entry.title
    end
  end
end









