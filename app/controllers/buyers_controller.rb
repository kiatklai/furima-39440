class BuyersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @buyer_destination = BuyerDestination.new
  end

  def create
    @buyer_destination = BuyerDestination.new(buyer_params)
    if @buyer_destination.valid?
      #pay_item  後日作るpayment method
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buyer_params
    # この時点では、order_idが不要。またrequire外の情報は参照するため、mergeとする。
    params.require(:buyer_destination).permit(:post_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
