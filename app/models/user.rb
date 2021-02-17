class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :first_name
    validates :kana_last_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナでの入力が必要。"}
    validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナでの入力が必要。"}
    validates :birthday
  end
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]/i, message: "は半角英数字混合での入力が必要。"}
end
