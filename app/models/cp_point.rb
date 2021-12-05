class CpPoint < ApplicationRecord
  #どちらも、
  belongs_to :user, foreign_key: "answerer_id"#, as: "Answer"
  #belongs_to :user, foreign_key: "evaluated_user_id", as: "EvalutedUser"

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
