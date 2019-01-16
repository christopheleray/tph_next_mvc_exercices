# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Administration::ItemsController, type: :controller do
  let(:item2) { build_stubbed(:item, :without_discount, original_price: 20) }
  let(:item1) { build_stubbed(:item, :with_discount, original_price: 20, discount_percentage: 50) }

  describe 'GET #index' do
    it 'returns http success' do
      skip
      request.session[:admin_id] = 1
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
end
