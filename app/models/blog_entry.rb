class BlogEntry < ActiveRecord::Base
  has_many :comments 

  attr_accessible :body, :title, :mashify_title, :dashify_title
  validates :body, :title, presence: true,
 					length: { minimum: 1}


  def dashify
    return self.body.upcase.gsub('-','*').chars.join('-')
  end
  
  def mashify
    return self.body.upcase.gsub('*', '!').strip.chars.join('*')
  end


end
