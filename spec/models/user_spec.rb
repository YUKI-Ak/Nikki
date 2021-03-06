require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it "nickname,email、passwordとpassword_confirmation,family_name,last_name,fname_kana,lname_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it "nicknameが空では登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = nil
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
      it "emailが@を含まない場合登録できない" do
        @user.email = "asdfghkl"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "test1"
        @user.password_confirmation = "test1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = "test123"
        @user.password_confirmation = "test456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが半角英字のみでは登録できない" do
        @user.password = "abcdefg"
        @user.password_confirmation = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字それぞれ１文字以上含む必要があります")
      end
      it "passwordが半角数字のみでは登録できない" do
        @user.password = 1111111
        @user.password_confirmation = 111111
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字それぞれ１文字以上含む必要があります")
      end
      it "passwordが全角では登録できない" do
        @user.password = "１１１１１１"
        @user.password_confirmation = "１１１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字それぞれ１文字以上含む必要があります")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name に全角文字を使用してください")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name に全角文字を使用してください")
      end
      it "last_nameが半角では登録できない" do
        @user.last_name = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name に全角文字を使用してください")
      end
      it "first_nameが半角では登録できない" do
          @user.first_name = "ﾀﾛｳ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name に全角文字を使用してください")
      end
      it "lname_kanaが空では登録できない" do
        @user.lname_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Lname kana can't be blank", "Lname kana に全角カタカナ文字を使用してください")
      end
      it "fname_kanaが空では登録できない" do
        @user.fname_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Fname kana can't be blank", "Fname kana に全角カタカナ文字を使用してください")
      end
      it "lname_kanaがかな文字では登録できない" do
        @user.lname_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lname kana に全角カタカナ文字を使用してください")
      end
      it "fname_kanaがかな文字では登録できない" do
        @user.fname_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Fname kana に全角カタカナ文字を使用してください")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
