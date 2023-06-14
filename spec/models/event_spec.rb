require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe 'メッセージ投稿' do
    context 'メッセージが投稿できる場合' do
      it '日付、title、content、grade_idが存在していれば保存できる' do
        expect(@event).to be_valid
      end
      it 'imageが空でも保存できる' do
        @event.image = nil
        expect(@event).to be_valid
      end
    end
    context 'メッセージが投稿できない場合' do
      it '日付が空では保存できない' do
        @event.event_day = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Event day can't be blank")
      end
      it 'titleが空では保存できない' do
        @event.title = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Title can't be blank")
      end
      it 'contentが空では保存できない' do
        @event.content = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Content can't be blank")
      end
      it 'grade_idが空では保存できない' do
        @event.grade_id = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Grade can't be blank")
      end
      it "grade_idに「---」が選択されている場合は出品できない" do
        @event.grade_id = "1"
        @event.valid?
        expect(@event.errors.full_messages).to include()
      end
      it 'roomが紐付いていないと保存できない' do
        @event.room = nil
        @event.valid?
        expect(@event.errors.full_messages).to include('Room must exist')
      end
      it 'userが紐付いていないと保存できない' do
        @event.user = nil
        @event.valid?
        expect(@event.errors.full_messages).to include('User must exist')
      end
    end
  end
end