class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :conform_item_user
  def new
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    binding.pry
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postalcode, :street, :city, :prefecture_id, :building, :street, :phone_number, :token).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: @purchase.token,
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def conform_item_user
    redirect_to root_path if current_user.id == @item.user_id || !@item.purchase.nil?
  end
end
