class Feedback < ApplicationRecord
  validates :name, :email, :text, presence: true
  validates :email, 'valid_email_2/email': true
end
