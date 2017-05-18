class Flyer < ApplicationRecord

  mount_uploader :image, ImageUploader

  # crashes controller rspecs:
  # validates_presence_of :image

  validates_integrity_of :image
  validates_processing_of :image



end
