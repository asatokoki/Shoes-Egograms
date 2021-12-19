class FcPoint < ApplicationRecord
  belongs_to :user, foreign_key: "answerer_id"#, as: "Answer"
  validates :point, numericality: { in: 0..2 }
    validates :point, presence: true

end
