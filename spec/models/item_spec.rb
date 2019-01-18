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

    describe 'validation test' do
      let(:item) { Item.new }
      let(:item_attributes) { build(:item) }

      it 'is valid with valid attributes' do
        expect(item_attributes).to be_valid
      end
      it 'is not valid without attributes' do
        expect(item).not_to be_valid
      end
      it 'is valid with original_price not null' do
        item.original_price = 10
        item.name = 'test item'
        expect(item).to be_valid
      end
      it 'is not valid with original_price as a string' do
        item.original_price = 'string'
        expect(item).not_to be_valid
      end
      it 'is not valid with original_price to be nil' do
        item.original_price = nil
        expect(item).not_to be_valid
      end
      it 'is not valid with has_discount to be nil' do
        item_attributes.original_price = nil
        expect(item).not_to be_valid
      end
      it 'is valid with discount_percentage between 0 and 100' do
        item_attributes.discount_percentage = 50
        expect(item_attributes).to be_valid
      end
      it 'is not valid with discount_percentage greater than 100' do
        item_attributes.discount_percentage = 200
        expect(item_attributes).not_to be_valid
      end
      it 'is not valid with discount_percentage less than 0' do
        item_attributes.discount_percentage = -20
        expect(item_attributes).not_to be_valid
      end
      it 'is not valid with discount_percentage to be a string' do
        item_attributes.discount_percentage = 'string'
        expect(item_attributes).not_to be_valid
      end
      it 'is not valid with an empty name' do
        item_attributes.name = nil
        expect(item_attributes).not_to be_valid
      end
    end

    describe 'item update price' do
      it 'matches price.item ' do
        item = build(:item_without_discount, original_price: 20)
        expect { item.update(discount_percentage: 50, has_discount: true) }.to change(item, :price).from(20).to(10)
      end
    end

    describe '.average_price' do
      let(:item1) { build_stubbed(:item, :with_discount, original_price: 20, discount_percentage: 50) }
      let(:item2) { build_stubbed(:item, :without_discount, original_price: 20) }

      it 'returns average_price ' do
        skip
        expect(Item.average_price).to eq(15)
      end
    end
  end
end
