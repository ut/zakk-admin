class Page < ApplicationRecord

  has_many :contents

  accepts_nested_attributes_for :contents

  validates :title, presence: true

end
