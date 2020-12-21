require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての情報が正しく記入できていれば、新規登録ができる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do

      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに@を含まない場合に登録できない" do
        @user.email = "aaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "111aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "last_nameが英字では登録できない" do
        @user.last_name = Gimei.last.romaji
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "last_nameが数字では登録できない" do
        @user.last_name = 11
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_nameが英字では登録できない" do
        @user.first_name = Gimei.first.romaji
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "first_nameが数字では登録できない" do
        @user.first_name = 11
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "last_name_kanaが英字では登録できない" do
        @user.last_name_kana = Gimei.last.romaji
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "last_name_kanaが数字では登録できない" do
        @user.last_name_kana = 11
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "last_name_kanaが漢字では登録できない" do
        @user.last_name_kana = Gimei.last.kanji
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "last_name_kanaがひらがなでは登録できない" do
        @user.last_name_kana = Gimei.last.hiragana
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "first_name_kanaが英字では登録できない" do
        @user.first_name_kana = Gimei.first.romaji
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "first_name_kanaが数字では登録できない" do
        @user.first_name_kana = 11
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "first_name_kanaが漢字では登録できない" do
        @user.first_name_kana = Gimei.first.kanji
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "first_name_kanaがひらがなでは登録できない" do
        @user.first_name_kana = Gimei.first.hiragana
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end
