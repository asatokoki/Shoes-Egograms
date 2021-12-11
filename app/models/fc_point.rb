class FcPoint < ApplicationRecord
  belongs_to :user, foreign_key: "answerer_id"#, as: "Answer"
end
