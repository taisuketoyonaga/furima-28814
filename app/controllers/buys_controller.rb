class BuysController < ApplicationController
  before_action :buys_params, only: :index
 
  def index
   @item = Item.find(params[:item_id])
  end

  def create
  end

  private
    

  def buys_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end


end
