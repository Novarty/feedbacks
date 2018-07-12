class FeedbacksController < ApplicationController
  expose :feedbacks, -> { init_feedbacks }
  expose :feedback

  def index
    authorize feedback
  end

  def new
    return unless current_user
    feedback.name = current_user.name
    feedback.email = current_user.email
  end

  def create
    if feedback.save
      FeedbackMailer.send_feedback(feedback).deliver_now
      redirect_to root_path, notice: "Feedback was successfully sent!"
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :text)
  end

  def init_feedbacks
    feedbacks = Feedback.order(created_at: :desc)
    if params[:search]
      feedbacks = feedbacks.where("name ILIKE ? OR text ILIKE ?",
        "%#{params[:search]}%",
        "%#{params[:search]}%")
    end
    feedbacks.page(params[:page])
  end
end
