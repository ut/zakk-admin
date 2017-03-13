class Content < ApplicationRecord


  belongs_to :page

  validates :title, presence: true
  validates :col, presence: true
  validates :pos, presence: true
  validates :page_id, presence: true

end
