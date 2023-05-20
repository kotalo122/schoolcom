class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    with_options presence: true do
    validates :name
    validates :position_id
    validates :position_code
  end
  validates :position_id, numericality: { other_than: 1 , message: "can't be blank"}

  has_many :room_users
  has_many :rooms, through: :room_users
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade
end
