require "rails_helper"

RSpec.describe "Admin::User", type: :feature do
  let(:admin_path) { "" }

  before do
    @admin_user = FactoryBot.create(:admin_user)
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)

    sign_in_with_admin_user(@admin_user, admin_path)
  end

  scenario "GET 'index'" do
    visit "#{admin_path}/users"

    within "#index_table_users" do
      expect(page).to have_content(@user1.email_address)
      expect(page).to have_content(@user2.email_address)
    end
  end

  scenario "GET 'show'" do
    visit "#{admin_path}/users/#{@user1.id}"

    expect(page).to have_content(@user1.email_address)
  end

  scenario "GET 'new' and create new user" do
    visit "#{admin_path}/users/new"

    within "#new_user" do
      fill_in "user_email_address", with: "newuser@email.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      click_button "Create User"
    end

    expect(page).to have_content("User was successfully created")

    expect(page).to have_content("newuser@email.com")
  end

  scenario "GET 'edit' and update user" do
    visit "#{admin_path}/users/#{@user1.id}/edit"

    within "#edit_user" do
      fill_in "user_email_address", with: "updateduser@email.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      click_button "Update User"
    end

    expect(page).to have_content("User was successfully updated")

    expect(page).to have_content("updateduser@email.com")
  end

  scenario "DELETE 'destroy' user" do
    visit "#{admin_path}/users/#{@user1.id}"

    click_link "Delete User"

    expect(page).to have_content("User was successfully destroyed")

    within "#index_table_users" do
      expect(page).not_to have_content(@user1.email_address)
      expect(page).to have_content(@user2.email_address)
    end
  end
end
