class PurchasesController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new
  end

  def create
    
    @item = Item.find(params[:item_id])
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
    params.require(:purchase_address).permit(:postalcode, :street, :city, :prefecture_id, :building, :street, :phone_number, :token,:item_id).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

end
