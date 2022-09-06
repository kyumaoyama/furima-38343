class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item,only:[:edit,:show,:update]
  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  
  def edit
    if @item.user_id == current_user.id 
    else
      redirect_to root_path
    end
  end 
  
  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path(item_params)
  else
    render 'edit'
   end
  end

  def show
    
  end
  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :situation_id, :shipping_charge_id, :prefecture_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
   end
end
