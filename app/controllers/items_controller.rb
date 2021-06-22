class ItemsController < ApplicationController
  
  #読み込む前に使いたい処理をまとめて記述
  before_action :authenticate_user!, except: [:index]
  # before_action :set_command, only: :show

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

  # def show 
  # end

  #privateメソッドで処理をまとめておく
  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_charge_id, :shipped_area_id, :day_to_shipped_id, :price, :image).merge(user_id: current_user.id)
  end

  # def set_command
  #   @item = Item.find(params[:id])
  # end
end
