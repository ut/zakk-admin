class Location < ActiveRecord::Base
  has_many  :posts

  validates :title, presence: true



  def twitter_link
    "https://twitter.com/#{self.twitter}"
  end
end
