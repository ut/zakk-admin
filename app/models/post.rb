class Post < ActiveRecord::Base

  after_initialize :set_defaults, unless: :persisted?
  # The set_defaults will only work if the object is new

  mount_uploader :image, ImageUploader

  belongs_to  :location
  belongs_to  :program



  validates :title, presence: true

  scope :with_status, lambda { |name|
    where('status = ?', name)
  }

  # ["Programm","Neues im zakk","Und sonst?"]
  scope :with_ptype, lambda { |name|
    where('ptype = ?', name)
  }


  def set_defaults
    self.status  ||= 'draft'
  end

end
