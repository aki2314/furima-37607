class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :new
    end
  end

  def create
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
