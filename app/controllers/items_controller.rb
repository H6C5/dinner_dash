class ItemsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @categories = Category.all
    @user       = User.find_by(params[:id])
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find_by(params[:id])
  end

  # def create
  #   @item = Item.new(item_params)
  #   @item.save

  #   # params[:item][:categories_list].each do |category|
  #   #   @item.categories.update(title: category)
  #   # end


  #   if @item.save
  #     respond_with @item, location: administrator_items_url
  #     flash.notice = "A new item: '#{@item.title}' was successfully created"
  #   else
  #     flash[:notice] = "Not Saved"
  #   end
  # end

  private

    def item_params
      params.require(:item).permit(:title,
                                   :description,
                                   :price,
                                   :image,
                                   :status,
                                   :categories_list)
    end

    def lookup_item
      @item = Item.find(params[:id])
    end
end
