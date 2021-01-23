class Owners::ShopsController < ApplicationController

  before_action :authenticate_owner!

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    binding.pry
    @shop = Shop.new(shop_params)
    binding.pry
    if @shop.save
      binding.pry
      redirect_to root_path
    else
      binding.pry
      render :new
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number)
  end

end
