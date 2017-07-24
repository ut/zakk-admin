class Content < ApplicationRecord


  belongs_to :page

  validates :col, presence: true
  validates :pos, presence: true
  validates :page, presence: true

end
