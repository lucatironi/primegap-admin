module Features
  module SessionHelpers
    def sign_in_with_admin_user(admin_user, admin_path = "/admin")
      visit "#{admin_path}/login"
      fill_in "Email", with: admin_user.email
      fill_in "Password", with: admin_user.password
      click_button "Sign In"
    end

    def sign_out_user
      Capybara.reset_sessions!
      visit destroy_user_session_path
    end
  end
end
