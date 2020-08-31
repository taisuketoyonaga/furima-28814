class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  #before_action :item_params, only: :new
  def index
  end

  def new
  end

  def create
  end

  #private

  #def item_params
   #params.require(:item).permit(:image,:name,:explain,:category_id,:delivery_fee_id,:status_id,:shopping_origin_id,:delivery_date_id,:price).merge(user_id: current_user.id)
  #end

end
