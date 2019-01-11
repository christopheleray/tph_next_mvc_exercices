# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'model instantiation' do 
    let(:category) { build(:category) }
    let(:item) { build(:item, :without_discount) }

    context 'when testing associations' do
      it { is_expected.to have_many(:items) } 
  end

    context 'item and category association' do
      it 'returns an OK response' do 
        expect(item).to respond_to(:categories)
      end
      it 'checks item.categories.count ' do
        skip
        puts "-----#{item.categories.count}-----"
        x = item.categories
        expect {item.categories << category }.to change(x, :count).from(0).to(1) 
      end
    end
  end
end
