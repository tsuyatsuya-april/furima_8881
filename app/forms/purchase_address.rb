class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postalcode, :prefecture_id, :city, :street, :building, :phone_number, :user_id, :item_id, :token
  post = /\A[0-9]{3}-[0-9]{4}\z/
  with_options presence: true do
    validates :postalcode, format: {with: post, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street
    validates :phone_number
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "Select" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postalcode: postalcode, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
