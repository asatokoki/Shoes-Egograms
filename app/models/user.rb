class User < ApplicationRecord
  attachment :profile_image

  has_many :cp_points, foreign_key: "answerer_id"
  has_many :np_points, foreign_key: "answerer_id"
  has_many :a_points, foreign_key: "answerer_id"
  has_many :fc_points, foreign_key: "answerer_id"
  has_many :ac_points, foreign_key: "answerer_id"

  has_many :cp_points_e, class_name: 'CpPoint', foreign_key: "evaluated_user_id"
  has_many :np_points_e, class_name: 'NpPoint', foreign_key: "evaluated_user_id"
  has_many :a_points_e, foreign_key: "evaluated_user_id"
  has_many :fc_points_e, foreign_key: "evaluated_user_id"
  has_many :ac_points_e, foreign_key: "evaluated_user_id"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
