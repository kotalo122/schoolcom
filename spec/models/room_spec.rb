require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'ルーム作成' do
    context '新規作成できる場合' do
      it "nameとgrade_idが存在すれば登録できる" do
        expect(@room).to be_valid
      end
    end
    context '新規作成できない場合' do
      it "nameが空では作成できない" do
        @room.name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end
      it "grade_idが空の場合は出品できない" do
        @room.grade_id = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Grade can't be blank")
      end
      it "grade_idに「---」が選択されている場合は出品できない" do
        @room.grade_id = '1'
        @room.valid?
        expect(@room.errors.full_messages).to include("Grade can't be blank")
      end
    end
  end
end