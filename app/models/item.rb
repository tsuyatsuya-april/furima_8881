class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :pay_state
  belongs_to_active_hash :ship_origin_prefecture
  belongs_to_active_hash :ship_prepare
  belongs_to_active_hash :state
  validates :name, :description, :category, :state,
            :pay_state, :ship_origin_prefecture,
            :ship_prepare, :price, presence: true
  validates :category, :state, :pay_state, :ship_origin_prefecture,
            :ship_prepares, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
