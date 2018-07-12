require "rails_helper"

feature "Visitor signs in" do
  before { visit new_user_session_path }

  let(:user) { create :user }

  scenario "with correct credentials" do
    sign_in(user.email, user.password)
    expect(page).to have_content(user.email)
    expect(page).to have_content "Signed in successfully."
  end

  scenario "with invalid password" do
    sign_in(user.email, "bla-bla")
    expect(page).to have_content "Log in"
    expect(page).to have_content "Invalid Email or password."
  end

  scenario "with invalid email" do
    sign_in("invalid_email", user.password)
    expect(page).to have_content "Log in"
    expect(page).to have_content "Invalid Email or password."
  end

  scenario "with blank fields" do
    sign_in("", "")
    expect(page).to have_content "Log in"
    expect(page).to have_content "Invalid Email or password."
  end
end

feature "Visitor signs up" do
  before { visit new_user_registration_path }

  scenario "with valid email and password" do
    sign_up_with "valid@example.com", "password", "password", "name"

    expect(page).to have_content("Sign out")
  end

  scenario "with invalid email" do
    sign_up_with "invalid_email", "password", "password", "name"

    expect(page).to have_content("Log in")
  end

  scenario "with blank password" do
    sign_up_with "valid@example.com", "", "", "name"

    expect(page).to have_content("Log in")
  end
end
