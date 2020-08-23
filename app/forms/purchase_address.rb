class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postalcode, :prefecture_id, :city, :street, :building, :phone_number, :user_id, :item_id, :token
  post = /\A[0-9]{3}-[0-9]{4}\z/
  # hankaku = /\A[a-zA-Z0-9]+\z/
  # cvc_num = /\A[0-9]{3,4}\z/
  with_options presence: true do
    validates :postalcode, format: {with: post, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street
    validates :phone_number
    # validates :number, format: {with: hankaku, message: "is invalid." }
    # validates :exp_month
    # validates :exp_year
    # validates :cvc, format: {with: cvc_num, message: "is invalid. three or four number only" }
    # validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: current_user.id, item_id: params[:item_id])
    Address.create(postalcode: postalcode, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
