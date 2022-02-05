class BuyersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_buy_buyer = ItemBuyBuyer.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_buy_buyer = ItemBuyBuyer.new(item_buy_buyer_params)
    if @item_buy_buyer.valid?
      @item_buy_buyer.save
        redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_buy_buyer_params
    params.require(:item_buy_buyer).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
