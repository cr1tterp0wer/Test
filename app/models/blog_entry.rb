class BlogEntry < ActiveRecord::Base
  has_many :comments 

  attr_accessible :body, :title, :mashify_title, :dashify_title
  validates :body, :title, presence: true,
 					length: { minimum: 1}
  
  def mashify!
    self.title.upcase.gsub('*', '!').strip.chars.join('*')
  end

  def dashify!
  	self.title.upcase.gsub('-','*').chars.join('-')
  end

end
