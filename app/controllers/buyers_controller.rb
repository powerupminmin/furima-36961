class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @item_buy_buyer = ItemBuyBuyer.new
    if current_user == @item.user || @item.item_buy != nil
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @item_buy_buyer = ItemBuyBuyer.new(item_buy_buyer_params)
    if @item_buy_buyer.valid?
      pay_item
      @item_buy_buyer.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_buy_buyer_params
    params.require(:item_buy_buyer).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: item_buy_buyer_params[:token], 
      currency: 'jpy' 
    )
  end

end
