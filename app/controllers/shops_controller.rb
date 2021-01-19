class ShopsController < ApplicationController

  def index
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path
    else
      # render :new
    end
  end

end
