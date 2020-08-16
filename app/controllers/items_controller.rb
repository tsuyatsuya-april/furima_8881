class ItemsController < ApplicationController
  # トップページ以外はログインしていないと見れない(今後実装のshowアクションも除く)
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show]
  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :image, :description,
                                 :category_id, :state_id, :pay_state_id,
                                 :ship_origin_prefecture_id, :ship_prepare_id,
                                 :price).merge(user_id: current_user.id)
  end
end
