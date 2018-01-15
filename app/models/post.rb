class Post < ActiveRecord::Base

  after_initialize :set_defaults, unless: :persisted?
  # The set_defaults will only work if the object is new

  mount_uploader :image, ImageUploader

  belongs_to  :location
  belongs_to  :program

  require 'date'

  validates :title, presence: true


  scope :published, -> { where status: 'Published' }

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


  def starttime
    "#{self.startdate.hour}.#{sprintf '%02d', self.startdate.min}"
  end

  def startday
    "#{self.startdate.day}.#{self.startdate.month}"
  end

  def startweekday

    day = {0 => "Sontag",
            1 => "Montag",
            2 => "Dienstag",
            3 => "Mittwoch",
            4 => "Donnerstag",
            5 => "Freitag",
            6 => "Samstag"}
    day[self.startdate.wday]
  end

end
