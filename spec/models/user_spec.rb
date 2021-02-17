require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "abc@efg.com", password: "123abc", password_confirmation: "123abc",\
         last_name: "山口", first_name: "一郎", kana_last_name: "ヤマグチ", kana_first_name: "イチロウ", birthday: "1930-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      user = User.new(nickname: "abc", email: "", password: "123abc", password_confirmation: "123abc",\
        last_name: "山口", first_name: "一郎", kana_last_name: "ヤマグチ", kana_first_name: "イチロウ", birthday: "1930-01-01")
     user.valid?
     expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailは@を含まないと登録できない" do
      user = User.new(nickname: "abc", email: "gmail.com", password: "123abc", password_confirmation: "123abc",\
        last_name: "山口", first_name: "一郎", kana_last_name: "ヤマグチ", kana_first_name: "イチロウ", birthday: "1930-01-01")
     user.valid?
     expect(user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空だと登録できない" do
      user = User.new(nickname: "abc", email: "abc@efg.com", password: "", password_confirmation: "",\
        last_name: "山口", first_name: "一郎", kana_last_name: "ヤマグチ", kana_first_name: "イチロウ", birthday: "1930-01-01")
     user.valid?
     expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordは6文字未満だと登録できない" do
      user = User.new(nickname: "abc", email: "abc@efg.com", password: "abc12", password_confirmation: "abc12",\
        last_name: "山口", first_name: "一郎", kana_last_name: "ヤマグチ", kana_first_name: "イチロウ", birthday: "1930-01-01")
     user.valid?
     expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordとpassword_confirmationが一致していないと登録できない" do
      user = User.new(nickname: "abc", email: "abc@efg.com", password: "abc123", password_confirmation: "abc121",\
        last_name: "山口", first_name: "一郎", kana_last_name: "ヤマグチ", kana_first_name: "イチロウ", birthday: "1930-01-01")
     user.valid?
     expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordは半角英数字混合で入力しないと登録できない" do
      user = User.new(nickname: "abc", email: "abc@efg.com", password: "abcdefg", password_confirmation: "abcdefg",\
        last_name: "山口", first_name: "一郎", kana_last_name: "ヤマグチ", kana_first_name: "イチロウ", birthday: "1930-01-01")
     user.valid?
     expect(user.errors.full_messages).to include("Password は半角英数字混合での入力が必要。")
    end
    it "first_nameが空だと登録できない" do
      user = User.new(nickname: "abc", email: "abc@efg.com", password: "123abc", password_confirmation: "123abc",\
        last_name: "山口", first_name: "", kana_last_name: "ヤマグチ", kana_first_name: "イチロウ", birthday: "1930-01-01")
     user.valid?
     expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが空だと登録できない" do
      user = User.new(nickname: "abc", email: "abc@efg.com", password: "123abc", password_confirmation: "123abc",\
        last_name: "", first_name: "一郎", kana_last_name: "ヤマグチ", kana_first_name: "イチロウ", birthday: "1930-01-01")
     user.valid?
     expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "last_nameが半角だと登録できない" do
      user = User.new(nickname: "abc", email: "abc@efg.com", password: "123abc", password_confirmation: "123abc",\
        last_name: "yamaguchi", first_name: "一郎", kana_last_name: "ヤマグチ", kana_first_name: "イチロウ", birthday: "1930-01-01")
     user.valid?
     expect(user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end
    it "kana_last_nameが空だと登録できない" do
      user = User.new(nickname: "abc", email: "abc@efg.com", password: "123abc", password_confirmation: "123abc",\
        last_name: "山口", first_name: "一郎", kana_last_name: "", kana_first_name: "イチロウ", birthday: "1930-01-01")
     user.valid?
     expect(user.errors.full_messages).to include("Kana last name can't be blank")
    end
    it "kana_first_nameが空だと登録できない" do
      user = User.new(nickname: "abc", email: "abc@efg.com", password: "123abc", password_confirmation: "123abc",\
        last_name: "山口", first_name: "一郎", kana_last_name: "ヤマグチ", kana_first_name: "", birthday: "1930-01-01")
     user.valid?
     expect(user.errors.full_messages).to include("Kana first name can't be blank")
    end
    it "kana_last_nameは全角(カタカナ)でないと登録できない" do
      user = User.new(nickname: "abc", email: "abc@efg.com", password: "123abc", password_confirmation: "123abc",\
        last_name: "山口", first_name: "一郎", kana_last_name: "やまぐち", kana_first_name: "イチロウ", birthday: "1930-01-01")
     user.valid?
     expect(user.errors.full_messages).to include("Kana last name は全角カタカナでの入力が必要。")
    end
    it "kana_first_nameが空だと登録できない" do
      user = User.new(nickname: "abc", email: "abc@efg.com", password: "123abc", password_confirmation: "123abc",\
        last_name: "山口", first_name: "一郎", kana_last_name: "ヤマグチ", kana_first_name: "ichirou", birthday: "1930-01-01")
     user.valid?
     expect(user.errors.full_messages).to include("Kana first name は全角カタカナでの入力が必要。")
    end
    it "birthdayが空だと登録できない" do
      user = User.new(nickname: "abc", email: "abc@efg.com", password: "123abc", password_confirmation: "123abc",\
        last_name: "山口", first_name: "一郎", kana_last_name: "ヤマグチ", kana_first_name: "イチロウ", birthday: "")
     user.valid?
     expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
