class Egogram < ApplicationRecord
  attachment :egogram_image
  validates :strong_point_title, presence: true
  validates :strong_point_body, presence: true
  validates :weak_point_title, presence: true
  validates :weak_point_body, presence: true
  validates :advice_title, presence: true
  validates :advice_body, presence: true

end
