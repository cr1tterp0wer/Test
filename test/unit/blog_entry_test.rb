require 'test_helper'

class BlogEntryTest < ActiveSupport::TestCase
  test "#mashify!" do
  	blog_entry = BlogEntry.new
  	blog_entry.title = "mash"

    assert_equal "M*A*S*H", blog_entry.mashify!

    blog_entry.title = "chips"

    assert_equal "C*H*I*P*S", blog_entry.mashify!
  end
end
