class FeedbackPolicy < ApplicationPolicy
  def index?
    user.present? && user.admin?
  end

  private

  def feedback
    record
  end
end
