class FeedbackMailer < ApplicationMailer
  def send_feedback(feedback)
    @feedback = feedback
    mail to: ENV["ADMIN_EMAIL"],
         subject: "Recieved new feedback"
  end
end
