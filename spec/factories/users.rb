# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    #  first_name { Faker::Name.first_name }
    #  last_name { Faker::Name.last_name }
    email { 'test@gmail.com' }
    password { 'P@ssword09' }
  end
end
