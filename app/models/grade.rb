app/models/grade.rb
class Grade < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '１年生' },
    { id: 3, name: '２年生' },
    { id: 4, name: '３年生' },
    { id: 5, name: '４年生' },
    { id: 6, name: '５年生' },
    { id: 7, name: '６年生' },
    { id: 8, name: '７年生' },
    { id: 9, name: '８年生' },
    { id: 10, name: '９年生' },
    { id: 11, name: '全学年共通' }
  ]
  include ActiveHash::Associations
  has_many :rooms
  has_many :events
  end