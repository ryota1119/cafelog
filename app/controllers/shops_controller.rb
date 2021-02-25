class ShopsController < ApplicationController

  def index
    @shops = Shop.includes(:owner).includes(:comments).includes(:images).order("created_at DESC").limit(5)
  end

  def show
    @shop = Shop.find(params[:id])
    @image = @shop.images
    @comment = Comment.new
    @comments = @shop.comments.includes(:user).order("created_at DESC").limit(5)
  end
end
