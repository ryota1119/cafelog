class ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @comment = Comment.new
    @comments = @shop.comments.includes(:user)
  end
end
