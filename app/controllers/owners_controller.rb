class OwnersController < ApplicationController
  before_action :set_owner, only: [:show]
  
  def show
    @shops = Shop.where(owner_id: params[:id])
  end

  private

  def set_owner
    @owner = Owner.find(params[:id])
  end
end
