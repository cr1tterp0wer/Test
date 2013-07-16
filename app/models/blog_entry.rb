class BlogEntry < ActiveRecord::Base
 has_many :comments 

 attr_accessible :body, :title
 validates :title, presence: true

end
