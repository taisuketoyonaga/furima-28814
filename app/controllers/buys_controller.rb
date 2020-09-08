class BuysController < ApplicationController
 before_action :set_params, only: [:index, :create]
 before_action :sold_move_to_index, only: [:index, :show, :create]
 before_action :exhibitor_move_to_index, only: [:index, :show, :create]
  def index
   @buy = BuyAddress.new
  end

  def create
    @buy = BuyAddress.new(buys_params)
    if @buy.valid?
       pay_item
       @buy.save
       redirect_to root_path
    else
      render 'index'
    end
  end

  private
    
  def set_params
    @item = Item.find(params[:item_id])
  end

  def buys_params
    params.permit(:item_id, :token, :postal_code,:prefectures, :city, :address, :phone_number, :buiding).merge(user_id: current_user.id)
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buys_params[:token],
      currency:'jpy',
    )
  end

  def sold_move_to_index
    buy = Buy.where(item_id:@item.id )
    unless buy == [] 
      redirect_to root_path
    end
  end

  def exhibitor_move_to_index
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

end
