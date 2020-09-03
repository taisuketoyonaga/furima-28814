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
    @buy = Buy.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :delivery_fee_id, :status_id, :shopping_origin_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
