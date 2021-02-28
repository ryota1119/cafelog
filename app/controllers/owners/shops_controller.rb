class Owners::ShopsController < ApplicationController

  before_action :authenticate_owner!
  before_action :set_shop, only: [:show, :edit, :update]

  def index
    @shops = Shop.where(owner_id: current_owner.id)
    @tags = Shop.tag_counts_on(:tags).most_used(20) 
  end

  def new
    @shop = Shop.new
    @shop.images.build
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:success] = 'お店の登録しました。'
      redirect_to owners_shop_path(@shop)
    else
      render 'owners/shops/new'
    end
  end

  def show
    @image = @shop.images
    @tags = @shop.tag_counts_on(:tags)
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to owners_shop_path(@shop)
    else
      render edit
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :tag_list, images_attributes: [:url]).merge(owner_id: current_owner.id)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

end
