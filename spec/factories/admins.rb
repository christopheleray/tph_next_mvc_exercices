# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email { 'admin@gmail.com' }
    password { 'P@ssword09' }
    status { true }
  end
end
