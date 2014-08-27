class StaticPagesController < ApplicationController

  def home
    @user       = User.find_by(params[:id])
    @items      = Item.active
    @categories = Category.all
  end

  def about
  end


  def contact
  end


  private

end
