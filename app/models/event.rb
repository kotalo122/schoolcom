class Event < ApplicationRecord

  with_options presence: true do
    validates :event_day
    validates :title
    validates :content
    validates :grade_id
  end

  belongs_to :room
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade

end
