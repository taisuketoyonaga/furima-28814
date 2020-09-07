class BuysController < ApplicationController
#  attr_accessor :token
 before_action :set_params, only: [:index, :create]
  def index
   @buy = BuyAddress.new
  end

  def create
    @buy = BuyAddress.new(buys_params)
    if @buy.valid?
       pay_item
       @buy.save
       return redirect_to root_path
    else
      render 'index'
    end
  end

  private
    
  def set_params
    @item = Item.find(params[:item_id])
  end

  def buys_params
    params.permit(:item_id, :token).merge(user_id: current_user.id)
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buys_params[:token],
      currency:'jpy',
    )
  end

end
