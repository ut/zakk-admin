class Program < ActiveRecord::Base

  before_save :set_published
  before_save :falsify_all

	mount_uploader :image, ImageUploader
	mount_uploader :backgroundimage, ImageUploader

  has_many :posts

  validates :title, presence: true,
                    uniqueness: { case_sensitive: false }


  def falsify_all
    if self.current
      self.class.where('id != ? and current', self.id).update_all("current = false")
    end
  end


  def set_published
    if self.current == true
      self.published = true
    else
      # self.published = false
    end
    true
  end

end
