class Item < ApplicationRecord
  has_one_attached :image
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
  end
end
