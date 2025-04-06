require "rails_helper"

RSpec.describe "Admin::AdminUser", type: :feature do
  let(:admin_path) { "" }

  before do
    @admin_user = FactoryBot.create(:admin_user)
    @admin_user1 = FactoryBot.create(:admin_user)
    @admin_user2 = FactoryBot.create(:admin_user)

    sign_in_with_admin_user(@admin_user, admin_path)
  end

  scenario "GET 'index'" do
    visit "#{admin_path}/admin_users"

    within "#index_table_admin_users" do
      expect(page).to have_content(@admin_user1.email)
      expect(page).to have_content(@admin_user2.email)
    end
  end

  scenario "GET 'show'" do
    visit "#{admin_path}/admin_users/#{@admin_user1.id}"

    expect(page).to have_content(@admin_user1.email)
  end

  scenario "GET 'new' and create new admin user" do
    visit "#{admin_path}/admin_users/new"

    within "#new_admin_user" do
      fill_in "admin_user_email", with: "newadmin@email.com"
      fill_in "admin_user_password", with: "password"
      fill_in "admin_user_password_confirmation", with: "password"
      click_button "Create Admin user"
    end

    expect(page).to have_content("Admin user was successfully created")

    expect(page).to have_content("newadmin@email.com")
  end

  scenario "GET 'edit' and update admin user" do
    visit "#{admin_path}/admin_users/#{@admin_user1.id}/edit"

    within "#edit_admin_user" do
      fill_in "admin_user_email", with: "updatedadmin@email.com"
      fill_in "admin_user_password", with: "password"
      fill_in "admin_user_password_confirmation", with: "password"
      click_button "Update Admin user"
    end

    expect(page).to have_content("Admin user was successfully updated")

    expect(page).to have_content("updatedadmin@email.com")
  end

  scenario "DELETE 'destroy' admin user" do
    visit "#{admin_path}/admin_users/#{@admin_user1.id}"

    click_link "Delete Admin User"

    expect(page).to have_content("Admin user was successfully destroyed")

    within "#index_table_admin_users" do
      expect(page).not_to have_content(@admin_user1.email)
      expect(page).to have_content(@admin_user2.email)
    end
  end
end
