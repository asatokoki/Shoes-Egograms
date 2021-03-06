class NpPoint < ApplicationRecord
  belongs_to :answerer, class_name: 'User' # , as: "Answer"
  belongs_to :evaluated_user, class_name: 'User'
  validates :point, numericality: { in: 0..2 }
  validates :point, presence: true
end
