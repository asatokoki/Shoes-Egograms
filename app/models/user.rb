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

  validates :name, presence: true, length: { in: 1..15 }
  validates :age, numericality: { only_integer: true }
  validates :gender, inclusion: {
    in: %w(男 女 その他),
    message: "%{value} は無効です",
  }
  validates :profile_image, presence: true
  validates :job, presence: true
  validates :job_details, presence: true
  validates :annual_income, format: { with: /\A[0-9]+\z/ }
  validates :hobbies, presence: true
  validates :hobbies_details, presence: true
end
