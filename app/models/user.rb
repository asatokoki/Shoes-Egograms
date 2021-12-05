class User < ApplicationRecord
  attachment :profile_image

  has_many :cp_points, foreign_key: "answerer_id"
  has_many :np_points
  has_many :a_points
  has_many :fc_points
  has_many :ac_points
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
