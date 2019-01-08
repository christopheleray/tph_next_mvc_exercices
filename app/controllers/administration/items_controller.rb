# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
    def index
      @items = Item.sorted_by_price
    end

    def edit
      @item = Items.params[:id]
    end


    def update
      item = Item.find(params[:id])
      puts "-----new discount percentage is : #{params[:item][:discount_percentage]}-----"
      if params[:item][:discount_percentage] != 0
        item.update_attributes(item_params)
        item.has_discount = true
        item.save
        flash[:notice]
        else  
          item.update_attributes(item_params)
          item.has_discount = false
          item.save
          flash[:notice]
      end
      redirect_to administration_items_path
    end

  private
    def item_params
      params.require(:item).permit(:discount_percentage)
    end
  end
end
