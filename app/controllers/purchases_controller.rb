class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :item_carum
  def index
    @purchase_address = PurchaseAddress.new

    redirect_to root_path if current_user.id == @items.user_id || @items.purchase.present?
  end

  def create
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

  def item_carum
    @items = Item.find(params[:item_id])
  end
end
