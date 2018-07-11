require "rails_helper"

feature "Sending Email" do
  background do
    visit new_feedback_path
    open_email(ENV["ADMIN_EMAIL"])
  end

  scenario "testing for content" do
    expect(current_email.to).to eq [ENV["ADMIN_EMAIL"]]
    expect(current_email.subject).to eq "Recieved new feedback"
    expect(current_email).to have_content "You recieved a new feedback from"
  end
end
