class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :pay_state
  belongs_to_active_hash :ship_origin_prefecture
  belongs_to_active_hash :ship_prepare
  belongs_to_active_hash :state
  validates :name, :image, :description, :category_id, :state_id,
            :pay_state_id, :ship_origin_prefecture_id,
            :ship_prepare_id, :price, presence: true
  validates :category_id, :state_id, :pay_state_id, 
            :ship_prepare_id, numericality: { other_than: 1 }
  validates :ship_origin_prefecture_id, numericality: { other_than: 0 }          
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
