module Features
  module SessionHelpers
    def sign_up_with(email, password, conf_password, name)
      fill_in "Email", with: email
      fill_in "Password", with: password
      fill_in "Password confirmation", with: conf_password
      fill_in "Username", with: name
      click_button "Sign up"
    end

    def sign_in(email, password)
      fill_in "Email", with: email
      fill_in "Password", with: password
      click_button "Log in"
    end
  end
end
