class Event < ApplicationRecord

  with_options presence: true do
    validates :event_day
    validates :title
    validates :content
    validates :grade_id
  end

  belongs_to :room
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade
  has_one_attached :image


  def start_time
    event_day.beginning_of_day
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
