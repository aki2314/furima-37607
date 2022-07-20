class PurchasesController < ApplicationController
  def index
    @purchase_address = PurchaseAddress.new
    @items = Item.find(params[:item_id])
  end

  def create
    @items = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:purchase_id, :post_number, :shipmentsource_id, :si, :banti, :building, :phone).merge(
      user_id: current_user.id, item_id: @items.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @items[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
