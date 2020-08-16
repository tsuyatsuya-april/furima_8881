class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :pay_state
  belongs_to_active_hash :ship_origin_prefecture
  belongs_to_active_hash :ship_prepare
  belongs_to_active_hash :state
  with_options presence: true do
    validates :name
    validates :image 
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '半角表記にて、300~9,999,999の範囲を指定下さい。' }
  end
  with_options numericality: { other_than: 0, message: 'セレクトボタンにて項目を選択下さい' } do
    validates :category_id
    validates :state_id
    validates :pay_state_id
    validates :ship_prepare_id
    validates :ship_origin_prefecture_id
  end 
end
