class BlogEntry < ActiveRecord::Base
  has_many :comments 

  attr_accessible :body, :title, :mashify_title, :dashify_title
  validates :body, :title, presence: true,
            length: { minimum: 1 }

  def dashify(str)
    str = str.to_s.upcase.gsub('-','').strip.chars.join('-')
    return str
  end
  
  def mashify(str)
    str = str.to_s.upcase.gsub('*', '').strip.chars.join('*').to_s
    return str
  end

  def formatted_title
    str = self.title

    if( self.mashify_title? )
      str = self.mashify(str)
    end
    if( self.dashify_title? )
      str = self.dashify(str)
    end
    return str
  end

end