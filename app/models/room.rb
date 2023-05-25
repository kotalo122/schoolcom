class Room < ApplicationRecord
  validates :name, presence: true
  validates :grade_id, numericality: { other_than: 1 , message: "can't be blank"}

  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :events, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade
end
