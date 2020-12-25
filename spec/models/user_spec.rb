require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "全ての情報が正しく入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context "新規登録できないとき" do
      # emailに関するテスト
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@が含まれていないと登録できない" do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      # passwordに関するテスト
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが５文字以下だと登録できない" do
        @user.password = '123ab'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "passwordが半角数字のみの場合登録できない" do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers.')
      end
      it "passwordが半角英字のみの場合登録できない" do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers.')
      end
      it "passwordが全角英数字の場合登録できない" do
        @user.password = 'ａｂｃ123'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers.')
      end
      # password_confirmationに関するテスト
      it "password_confirmationが空だと登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "password_confirmationがpasswordと不一致だと登録できない" do
        @user.password_confirmation = 'abcd1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      # last_nameに関するテスト
      it "last_nameが空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank",
                                                      'Last name is invalid. Input full-width characters.')
      end
      it "last_nameに半角数字が含まれていると登録できない" do
        @user.last_name = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end
      it "last_nameに半角英字が含まれていると登録できない" do
        @user.last_name = 'abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end
      it "last_nameに全角英字が含まれていると登録できない" do
        @user.last_name = 'ａｂｃｄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end
      # last_name_enに関するテスト
      it "last_name_enが空だと登録できない" do
        @user.last_name_en = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name en can't be blank",
                                                      'Last name en is invalid. Input english(uppercase is letters)')
      end
      it "last_name_enに半角数字が含まれていると登録できない" do
        @user.last_name_en = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name en is invalid. Input english(uppercase is letters)')
      end
      it "last_name_enに全角英字が含まれていると登録できない" do
        @user.last_name_en = 'ａｂｃｄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name en is invalid. Input english(uppercase is letters)')
      end
      it "last_name_enに日本語表記が含まれていると登録できない" do
        @user.last_name_en = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name en is invalid. Input english(uppercase is letters)')
      end
      # first_nameに関するテスト
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank",
                                                      'First name is invalid. Input full-width characters.')
      end
      it "first_nameに半角数字が含まれていると登録できない" do
        @user.first_name = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it "first_nameに半角英字が含まれていると登録できない" do
        @user.first_name = 'abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it "first_nameに全角英字が含まれていると登録できない" do
        @user.first_name = 'ａｂｃｄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      # first_name_enに関するテスト
      it "first_name_enが空だと登録できない" do
        @user.first_name_en = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name en can't be blank",
                                                      'First name en is invalid. Input english(uppercase is letters)')
      end
      it "first_name_enに半角数字が含まれていると登録できない" do
        @user.first_name_en = '1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name en is invalid. Input english(uppercase is letters)')
      end
      it "first_name_enに全角英字が含まれていると登録できない" do
        @user.first_name_en = 'ａｂｃｄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name en is invalid. Input english(uppercase is letters)')
      end
      it "first_name_enに日本語表記が含まれていると登録できない" do
        @user.last_name_en = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name en is invalid. Input english(uppercase is letters)')
      end
      # birthdayに関するテスト
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
