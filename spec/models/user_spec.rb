require 'rails_helper'

RSpec.describe User, type: :model do
  before do
  
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが英字のみだと登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが数字のみだと登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが全角文字を含むと登録できない' do
      @user.password = 'あ11111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'firstnameが空だと登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end
    it 'firstnameに半角文字が含まれていると登録できない' do
      @user.firstname = 'あｵｸ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Firstname is invalid')
    end
    it 'familynameが空だと登録できない' do
      @user.familyname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Familyname can't be blank")
    end
    it 'familynameに半角文字が含まれていると登録できない' do
      @user.familyname = 'あｵｸ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Familyname is invalid')
    end
    it 'firstname_twoが空だと登録できない' do
      @user.firstname_two = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname two can't be blank")
    end
    it 'firstname_twoにカタカナ以外の文字が含まれていると登録できない' do
      @user.firstname_two = 'あカ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Firstname two is invalid')
    end
    it 'familyname_twoが空だと登録できない' do
      @user.familyname_two = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Familyname two can't be blank")
    end
    it 'familyname_twoにカタカナ以外の文字が含まれていると登録できない' do
      @user.familyname_two = 'あカ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Familyname two is invalid')
    end
    it 'birthdayが空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
