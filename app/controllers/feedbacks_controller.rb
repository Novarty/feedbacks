class FeedbacksController < ApplicationController
  expose :feedbacks, -> { init_feedbacks }
  expose :feedback

  def index
  end

  def new
    if current_user
      feedback.name = current_user.name
      feedback.email = current_user.email
    end
  end

  def create
    if feedback.save
      redirect_to root_path, notice: 'Feedback was successfully sent!'
      FeedbackMailer.send_feedback(feedback).deliver
    else
      render :new
    end
  end

  private
    def feedback_params
      params.require(:feedback).permit(:name, :email, :text)
    end

    def init_feedbacks
      feedbacks = Feedback.all
    end
end
