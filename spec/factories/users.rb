FactoryBot.define do
  factory :user do
    nickname  {'abc'}
    email {'abc@efg.com'}
    password {'123abc'}
    password_confirmation {'123abc'}
    last_name {'山口'}
    first_name {'一郎'}
    kana_last_name {'ヤマグチ'}
    kana_first_name {'イチロウ'}
    birthday {'1930-01-01'}
  end
end