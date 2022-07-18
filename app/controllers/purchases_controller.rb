class PurchasesController < ApplicationController
  def index
    @purchase_address = PurchaseAddress.new
  end


  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:purchase_id, :post_number, :shipmentsource_id, :si, :banti, :building, :phone, :item_id).merge(user_id: current_user.id)
  end
end
