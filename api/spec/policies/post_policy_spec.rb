require 'spec_helper'

describe Forge::PostPolicy, :type => :policy do
  subject { PostPolicy(user, post) }

  permissions :update?, :edit?, :destroy do
    it "denies access if user is not owner or admin" do
      let(:user) { create :user }
      #let(:post) { create :post }
      expect(subject).not_to permit(user, Post.new(title: "My Post"))
    end

    it "allows access if user is admin" do
      let(:admin) { create :admin }
      let(:post) { create :post }
      expect(subject).to_not permit(admin, post)
    end
  end
end