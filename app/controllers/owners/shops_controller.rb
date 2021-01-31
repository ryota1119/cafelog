class Owners::ShopsController < ApplicationController

  before_action :authenticate_owner!
  before_action :set_shop, only: [:show, :edit, :update]

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
    @shop.images.build
  end

  def create
    @shop = Shop.new(shop_params)
    binding.pry
    if @shop.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render edit
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, images_attributes: [:url]).merge(owner_id: current_owner.id)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

end
