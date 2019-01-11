# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::ItemsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update/:id' do
    subject(:update_item) { put :update, params: params }

    let(:item) { create(:item) }
    let(:params) { { id: item.id } }

    context 'without params' do
      it { expect(response).to have_http_status(:success) }
    end
  end
  
  let(:item1) { build(:item, :with_discount, original_price: 20, discount_percentage: 50) }
  let(:item2) { build(:item, :without_discount, original_price: 20) }

  describe '#price' do
    context 'when item has no discount' do
      it 'returns the original_price' do
        expect(item2.price).to eq(item2.original_price)
      end
    end
    context 'when item has a discount' do
      it 'returns the discounted price' do
        expect(item1.price).to eq(10)
      end
    end
  end

  describe '.average_price' do
    context 'List of item without discount' do 
      it 'returns average_price ' do
        expect(Item.average_price).to eq(15)
      end
    end 
    context 'List of item with discount' do 
      skip('to be done later')
      it '' do
      end  
    end
  end
end