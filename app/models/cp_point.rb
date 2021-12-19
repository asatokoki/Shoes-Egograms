class CpPoint < ApplicationRecord
  belongs_to :answerer, class_name: 'User', foreign_key: "answerer_id"#, as: "Answer"
  belongs_to :evaluated_user, class_name: 'User', foreign_key: 'evaluated_user_id'
  #belongs_to :user, foreign_key: "evaluated_user_id", as: "EvalutedUser"
  # validates :point, numericality: { in: 0..2 }
    validates :point, presence: true

  #答えた人を取りたい場合
  # @answerer = User.find(@cp_point.answeer_id)
  # @cp_point.answerer


 # @cp_points.each |point|
  #point.answereer
    #answerer = User.find(cp_point.answeer_id)
   # answerer
   #これがめんどいのでポリもフィック
 # end


end
