# frozen_string_literal: true

CategoryItemConnection.delete_all
Item.delete_all
Category.delete_all

1.upto(10) do |i|
  Item.create!(
    original_price: Faker::Number.decimal(2),
    name: Faker::Pokemon.name
  )
  p "ITEM #{i} : créé"
end

category = ['coffee', 'tea', 'accesssories']
category.each do |c|
  Category.create!(name: c, description: Faker::Lorem.sentence)
  p "Catgeory #{c} created"
end
