FactoryBot.define do
  factory :category_item_connection do
    item { "MyString" }
    references { "MyString" }
    category { nil }
  end
end
