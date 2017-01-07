class Location < ActiveRecord::Base
    has_many  :posts




  def twitter_link
    "https://twitter.com/#{self.twitter}"
  end
end
