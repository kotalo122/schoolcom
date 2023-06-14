class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX }

    with_options presence: true do
    validates :name
    validates :position_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :position_code, length: { minimum: 4, maximum: 11 }, format: { with: /\A[0-9]+\z/ }
  end

  

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :events
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :position
end
