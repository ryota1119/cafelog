class ShopsController < ApplicationController

  def index
    @shops = Shop.all.includes(:comments).order("created_at DESC").limit(5)
  end

  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
    @comments = @shop.comments.includes(:user).order("created_at DESC").limit(5)
  end
end
