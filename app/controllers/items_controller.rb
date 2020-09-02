class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :item_params, only: :create
  def index
    @item = Item.all
    @buy = Buy.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :delivery_fee_id, :status_id, :shopping_origin_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
