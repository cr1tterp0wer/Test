class BlogEntry < ActiveRecord::Base
  has_many :comments 

  attr_accessible :body, :title, :mashify_title, :dashify_title
  validates :body, :title, presence: true,
 					length: { minimum: 1}


  def dashify
    if(self.dashify_title)
      self.body = self.body.upcase.gsub('-','*').strip.chars.join('-')
    end
  end
  
  def mashify
    if(self.mashify_title)
      self.body = self.body.upcase.gsub('*', '!').strip.chars.join('*')
    end
  end
end

