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

class Item < ApplicationRecord
  validates :original_price, presence: true, numericality: true, allow_nil: false
  validates :has_discount, default: false
  validates :discount_percentage, numericality: { less_than_or_equalt_to: 100 }, allow_nil: true

  scope :sorted_by_price, -> { order("original_price ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  
  def price
    has_discount ? original_price - ( original_price * discount_percentage / 100) : original_price
  end

  def self.average_price
    @items = Item.all.map { |i| i.price }
    @average = @items.sum.fdiv(@items.size)
  end

end
