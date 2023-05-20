class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade

  validates :name, presence: true
  validates :grade_id, numericality: { other_than: 1 , message: "can't be blank"}
end
