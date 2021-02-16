class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
  end

  def edit
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
end
