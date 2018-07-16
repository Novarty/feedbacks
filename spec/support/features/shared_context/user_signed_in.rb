shared_context "current user signed in" do
  let(:user) { create :user }

  background do
    login_as user
  end
end

shared_context "current admin signed in" do
  let(:admin) { create :admin }

  background do
    login_as admin
  end
end
