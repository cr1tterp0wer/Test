class Comment < ActiveRecord::Base
  belongs_to :blog_entry
  attr_accessible :body, :commenter

end
