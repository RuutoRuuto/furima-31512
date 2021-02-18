require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailは@を含まないと登録できない" do
      @user.email = "gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordは6文字未満だと登録できない" do
      @user.password = "abc12"
      @user.password_confirmation = "abc12"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordとpassword_confirmationが一致していないと登録できない" do
      @user.password = "abc123"
      @user.password_confirmation = "abc121"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordは半角英数字混合で入力しないと登録できない" do
      @user.password = "abcdefg"
      @user.password_confirmation = "abcdefg"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数字混合での入力が必要。")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "last_nameが半角だと登録できない" do
      @user.last_name = "yamaguchi"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end
    it "kana_last_nameが空だと登録できない" do
      @user.kana_last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name can't be blank")
    end
    it "kana_first_nameが空だと登録できない" do
      @user.kana_first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end
    it "kana_last_nameは全角(カタカナ)でないと登録できない" do
      @user.kana_last_name = "やまぐち"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name は全角カタカナでの入力が必要。")
    end
    it "kana_first_nameは全角(カタカナ)でないと登録できない" do
      @user.kana_first_name = "ichirou"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name は全角カタカナでの入力が必要。")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
