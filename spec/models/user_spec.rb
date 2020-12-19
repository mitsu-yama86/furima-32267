require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての情報が正しく記入できていれば、新規登録ができる" do
        @user.birthday = 2020-01-01
        expect(@user).to be_valid
      end

      it "passwordが6文字以上であれば登録できる" do
        @user.password = "111aaa"
        @user.password_confirmation = "111aaa"
        @user.birthday = 2020-01-01
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do

      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "111aa"
        @user.valid?
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
      end

      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
      end

      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
      end

      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
      end

      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
      end

      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
      end

    end
  end
end
