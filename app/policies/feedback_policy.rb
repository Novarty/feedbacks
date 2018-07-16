class FeedbackPolicy < ApplicationPolicy
  def index?
    user.present? && user.admin?
  end

  def new?
    create?
  end
  
  def create?
    true
  end

  private

  def feedback
    record
  end
end
