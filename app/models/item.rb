class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :condition_id
    validates :delivery_burden_id
    validates :prefecture_id
    validates :days_to_delivery_id
  end

  belongs_to :user
  has_one :order
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_burden
  belongs_to :prefecture
  belongs_to :days_to_delivery
  has_one_attached :image
end
