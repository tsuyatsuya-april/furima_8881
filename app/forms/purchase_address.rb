class PurchaseAddress

  include ActiveModel: :Model
  attr_accessor :postalcode, :prefecture_id, :city, :street, :building, :phone_number

  with_options presence: true do
    validates :postalcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street
    validates :phone_number
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purechase = Purchase.create(user_id: current_user.id, item_id: )
    Address.create(postalcode: postalcode, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
