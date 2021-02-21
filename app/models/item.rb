class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :charge_type_id
      validates :prefecture_id
      validates :shipment_date_id
    end
    validates :name
    validates :description
    validates :price, format: { with: /[1-9]|[1-9][0-9]{2,6}/, message: "は300~9,999,999の範囲の半角数字での入力が必要"}
  end
end
