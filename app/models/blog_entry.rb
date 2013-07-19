class BlogEntry < ActiveRecord::Base
  has_many :comments 

  attr_accessible :body, :title, :mashify_title, :dashify_title
  validates :body, :title, presence: true,
 					length: { minimum: 1}


  def dashify!
    if(self.dashify_title)
      self.body = self.body.upcase.gsub('-','').strip.chars.join('-')
    else
      self.body = self.body.downcase.gsub('- ',' ').strip.chars.join('') 
      self.body = self.body.gsub(' -', ' ').strip.chars.join('')   
      self.body = self.body.gsub('-', '').strip.chars.join('')
    end
  end
  
  def mashify!
    if(self.mashify_title)

      self.body = self.body.upcase.gsub('*', '!').strip.chars.join('')
      self.body = self.body.gsub('*', '').strip.chars.join('*')
    else
      self.body = self.body.downcase.gsub('* ', ' ').strip.chars.join('')
      self.body = self.body.gsub(' *', ' ').strip.chars.join('')
      self.body = self.body.gsub('*', '').strip.chars.join('')
    end
  end

  def mash_dash!
    dashify!
    mashify!
  end

end

