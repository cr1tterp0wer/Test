class BlogEntry < ActiveRecord::Base
 has_many :comments 

 attr_accessible :body, :title
 validates :body, :title, presence: true,
 					length: { minimum: 1}

end
