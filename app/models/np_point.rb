class NpPoint < ApplicationRecord
  belongs_to :answerer, class_name: 'User', foreign_key: "answerer_id"#, as: "Answer"
  belongs_to :evaluated_user, class_name: 'User'
end
