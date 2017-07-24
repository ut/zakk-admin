class Page < ApplicationRecord

  has_many :contents, :inverse_of => :page

  accepts_nested_attributes_for :contents

  validates :title, presence: true

end
