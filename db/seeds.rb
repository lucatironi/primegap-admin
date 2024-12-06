# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
  User.create!(email_address: "user@example.com", password: "password", password_confirmation: "password")

  ["Acme & Co", "Weyland Yutani", "Tyrrel Corp", "Umbrella Corp", "Skynet"].each do |name|
     Company.find_or_create_by!(name: name)
  end
  ["John Doe", "Sarah Connor", "Ellen Ripley", "John Deckard", "Luke Skywalker"].each do |name|
    Customer.create!(full_name: name, email: "#{name.downcase.split(" ").join(".")}@xample.com", phone: "+49 #{rand.to_s[2..11]}")
  end
end
