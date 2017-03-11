class Page < ApplicationRecord

  has_many :contents

  validates :title, presence: true

end
