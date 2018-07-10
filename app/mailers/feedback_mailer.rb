class FeedbackMailer < ApplicationMailer
  def send_feedback(feedback)
    @feedback = feedback
    mail to: 'admin@example.com',
         subject: 'Recieved new feedback'
  end
end
