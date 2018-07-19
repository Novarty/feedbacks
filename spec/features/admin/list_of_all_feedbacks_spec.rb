require "rails_helper"

feature "Admin searching feedback" do
  include_context "current admin signed in"
  include_context "setup feedbacks"

  before { visit feedbacks_path }

  scenario "by name" do
    expect(page).to have_content(feedback.name)
    expect(page).to have_content(another_feedback.name)

    fill_in "search", with: feedback.name
    click_button "Search"
    expect(page).to have_content(feedback.name)
    expect(page).to_not have_content(another_feedback.name)
  end

  scenario "by text" do
    expect(page).to have_content(feedback.text)
    expect(page).to have_content(another_feedback.text)

    fill_in "search", with: feedback.text
    click_button "Search"
    expect(page).to have_content(feedback.text)
    expect(page).to_not have_content(another_feedback.text)
  end
end
