class Position < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '保護者' },
    { id: 3, name: '教員' }
  ]
  include ActiveHash::Associations
  has_many :users
  end