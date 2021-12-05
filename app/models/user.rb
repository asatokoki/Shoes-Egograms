class User < ApplicationRecord
  attachment :profile_image

  has_many :cp_points, foreign_key: "answerer_id"
  has_many :np_points, foreign_key: "answerer_id"
  has_many :a_points, foreign_key: "answerer_id"
  has_many :fc_points, foreign_key: "answerer_id"
  has_many :ac_points, foreign_key: "answerer_id"
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
