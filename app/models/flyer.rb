class Flyer < ApplicationRecord

  mount_uploader :image, ImageUploader

  validates_integrity_of :image
  validates_processing_of :image

  default_scope { order(updated_at: :desc) }

end
