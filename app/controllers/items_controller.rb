class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :item_params, only: :create
  before_action :set_params, only: [:show, :edit, :update, :destroy] 
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
    @buy = Buy.all
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id
    @item.destroy
    redirect_to root_path
    end
  end

  private
    
  def set_params
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :delivery_fee_id, :status_id, :shopping_origin_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
