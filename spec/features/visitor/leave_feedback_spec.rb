require "rails_helper"

feature "Leaving feedback" do
  before { visit new_feedback_path }

  scenario "Leaving valid feedback" do
    within("form") do
      fill_in 'Email', with: 'john@example.com'
      fill_in 'Name', with: 'John Smith'
      fill_in 'Text', with: 'My feedback.'
    end
    click_button 'Send feedback'
    expect(page).to have_content 'Feedback was successfully sent!'
  end

  scenario "Leaving empty feedback" do
    click_button 'Send feedback'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Text can't be blank"
  end

  scenario "Leaving invalid Email" do
    within("form") do
      fill_in 'Email', with: 'csda'
      fill_in 'Name', with: 'John Smith'
      fill_in 'Text', with: 'My feedback.'
    end
    click_button 'Send feedback'
    expect(page).to have_content "Email is invalid"
  end
end
