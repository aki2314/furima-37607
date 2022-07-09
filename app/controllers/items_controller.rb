class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  end

  def new

  end

end

private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end