# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  original_price      :float            not null
#  has_discount        :boolean          default(FALSE)
#  discount_percentage :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Model instantiation' do
    subject(:new_item) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:original_price).of_type(:float).with_options(null: false) }
      it { is_expected.to have_db_column(:has_discount).of_type(:boolean).with_options(default: false) }
      it { is_expected.to have_db_column(:discount_percentage).of_type(:integer).with_options(default: 0) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:name).of_type(:string).with_options(presence: true) }
    end

    describe 'Price' do
      context 'when the item has a discount' do
        let(:item) { build(:item_with_discount, original_price: 100.00, discount_percentage: 20) }

        it { expect(item.price).to eq(80.00) }
      end
      context 'when the item has no discount' do
        let(:item) { build(:item_without_discount, original_price: 100) }

        it { expect(item.price).to eq(100.00) }
      end
    end

    context 'Validation test' do
      it 'is valid with valid attributes' do
        item = build(:item)
        expect(item).to be_valid
      end    
      it 'is not valid without attributes' do 
        item = Item.new
        expect(item).to_not be_valid 
      end
      it 'is valid with original_price not null' do 
        item = Item.new(original_price: 10)
        expect(item).to be_valid
      end
      it 'is not valid with original_price as a string' do
        item = Item.new(original_price: 'test string')
        expect(item).to_not be_valid
      end
      it 'is not valid with original_price to be nil' do 
        item  = Item.new(original_price: nil)
        expect(item).to_not be_valid
      end
      it 'is not valid with has_discount to be nil' do 
        item = Item.new(has_discount: nil)
        expect(item).to_not be_valid
      end
      it 'is valid with discount_percentage between 0 and 100' do
        item = build(:item, discount_percentage: 50)
        expect(item).to be_valid
      end
      it 'is not valid with discount_percentage greater than 100' do 
        item = build(:item, discount_percentage: 200)
        expect(item).to_not be_valid
      end
      it 'is not valid with discount_percentage less than 0' do
        item = build(:item, discount_percentage: -20) 
        expect(item).to_not be_valid
      end 
      it 'is not valid with discount_percentage to be a string' do 
        item = build(:item, discount_percentage: "string")
        expect(item).to_not be_valid
      end
    end
  end   
end
