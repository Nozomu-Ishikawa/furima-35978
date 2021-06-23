class ItemsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_command, only: [:show, :edit, :update, :destroy]
  before_action :customer_insert, only: [:edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
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
    if @item.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  #privateメソッドで処理をまとめておく
  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_charge_id, :shipped_area_id, :day_to_shipped_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_command
    @item = Item.find(params[:id])
  end

  def customer_insert
    redirect_to root_path unless current_user.id == @item.user.id
  end
end
