class User < ApplicationRecord
  attachment :profile_image

  has_many :cp_point
  has_many :np_point
  has_many :a_point
  has_many :fc_point
  has_many :ac_point
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
