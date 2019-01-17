# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'model instantiation' do
    subject(:new_category) { decribed_class.new }
    let(:category) { create(:category) }
    let(:item) { create(:item, :without_discount) }

    describe 'item and category association' do
      it 'returns an OK response' do
        expect(item).to respond_to(:categories)
      end
      it 'follows item link' do
      item.categories << category
      expect(item.categories.first.items).to be
    end
      it 'checks item categories.count ' do
        skip
        puts "-----#{item.categories.count}-----"
        x = item.categories
        expect { item.categories << category }.to change(x, :count).from(0).to(1)
      end
    end
  end
end
