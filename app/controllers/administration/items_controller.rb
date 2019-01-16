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
      update_item(item)
      item_valid?(item)
      redirect_to administration_items_path
    end

  private

    def item_params
      params.require(:item).permit(:discount_percentage)
    end

    def item_valid?(item)
      if item.valid?
         item.save
        flash[:notice] = "Product updated successfuly"
      else
        flash[:alert] = item.errors.full_messages
      end
    end

    def update_item(item)
      if params[:item][:discount_percentage] != 0
        item.update(item_params)
        item.has_discount = true
      else  
        item.update(item_params)
        item.has_discount = false
      end
    end
  end
end
