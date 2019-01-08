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
      # puts "----je rentre dans update-----"
      # params.inspect
      # item = Item.find(params[:id])
      # puts "---j affiche item----"
      # puts params[:item][:discount_percentage]
      # p item
      # item.update_attributes(item_params)
      redirect_to administration_items_path
    end

  private
    def item_params
      params.require(:item).permit(:discount_percentage)
    end
  end
end
