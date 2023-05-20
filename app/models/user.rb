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

  has_many :room_users
  has_many :rooms, through: :room_users
end
