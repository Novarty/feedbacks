require "rails_helper"

feature "Admin sees a list of all feedbacks" do
  include_context "current admin signed in"
  include_context "setup feedbacks"

  before { visit feedbacks_path }

  scenario "with 3 fields" do
    expect(page).to have_content(feedback.name)
    expect(page).to have_content(feedback.email)
    expect(page).to have_content(feedback.text)
  end

  # scenario "sorted by 'newest first'" do
  #   pending
  # end
end
