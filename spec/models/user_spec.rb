require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmation,position_id,position_codeが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailに@あれば登録できる" do
        @user.email = "test@test.com"
        expect(@user).to be_valid
      end
      it "passwordが６文字以上の半角英数字混合であれば登録できる" do
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end
      it "position_codeが4文字以上の半角数字であれば登録できる" do
        @user.position_code = "0000"
        expect(@user).to be_valid
      end
      it "position_codeが11文字以内の半角数字であれば登録できる" do
        @user.position_code = "11223344556"
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nameが空では登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password =  Faker::Internet.password(min_length: 129)
        @user.password_confirmation =  @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "positon_idが空の場合は出品できない" do
        @user.position_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Position can't be blank")
      end
      it "position_idに「---」が選択されている場合は出品できない" do
        @user.position_id = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Position can't be blank")
      end
      it "position_codeが3文字以下の数字では登録できない" do
        @user.position_code = "000"
        @user.valid?
        expect(@user.errors.full_messages).to include('Position code is too short (minimum is 4 characters)')
      end
      it "position_codeが12文字以上の半角数字では登録できない" do
        @user.position_code = "112233445566"
        @user.valid?
        expect(@user.errors.full_messages).to include('Position code is too long (maximum is 11 characters)')
      end
      it "position_codeが全角数字では登録できない" do
        @user.position_code = "００００"
        @user.valid?
        expect(@user.errors.full_messages).to include('Position code is invalid')
      end
      it "position_codeが数字意外では登録できない" do
        @user.position_code = "一二三四"
        @user.valid?
        expect(@user.errors.full_messages).to include('Position code is invalid')
      end
    end
  end
end
