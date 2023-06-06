class ItemsController < ApplicationController
  def index

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

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :item_condition_id, :delivery_fee_id, :area_id, :deliver_day_id, :category_id, :image).merge(user_id: current_user.id)
  end
end
