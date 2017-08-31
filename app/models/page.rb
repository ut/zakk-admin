class Page < ApplicationRecord

  has_many :contents, :inverse_of => :page, :dependent => :destroy

  accepts_nested_attributes_for :contents

  validates :title, presence: true

end
