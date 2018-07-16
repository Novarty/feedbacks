require 'rails_helper'

describe FeedbackPolicy do
  subject { described_class }
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:visitor) { create(:user) { nil } }
  let(:feedback) { create(:feedback) }
  let(:feedbacks) { Feedback.all }

  permissions :create?, :new? do
    it "allows access to admin" do
      expect(subject).to permit( admin, feedback )
    end

    it "allows access to visitor" do
      expect(subject).to permit( visitor, feedback )
    end

    it "allows access to user" do
      expect(subject).to permit( user, feedback )
    end
  end

  permissions :index? do
    it "allows access to admin" do
      expect(subject).to permit( admin, feedbacks )
    end

    it "denies access to users" do
      expect(subject).not_to permit( user, feedbacks )
    end

    it "denies access to visitors" do
      expect(subject).not_to permit( visitor, feedbacks )
    end
  end
end
