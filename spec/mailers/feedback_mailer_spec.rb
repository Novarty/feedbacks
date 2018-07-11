require "rails_helper"

feature 'Sending Email' do
  background do
    visit new_feedback_path
    open_email('admin@example.com')
  end

  scenario 'testing for content' do
    expect(current_email.to).to eq ['admin@example.com']
    expect(current_email.subject).to eq "Recieved new feedback"
    expect(current_email).to have_content 'You recieved a new feedback from'
  end

end
