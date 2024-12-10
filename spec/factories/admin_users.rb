FactoryBot.define do
  factory :admin_user do
    sequence(:email) { |n| "adminuser#{n}@example.com" }
    password { "testtest" }
    password_confirmation { "testtest" }
  end
end
