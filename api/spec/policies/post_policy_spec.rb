require 'spec_helper'

describe Forge::PostPolicy, :type => :policy do
  subject { described_class }

  let(:user)             { create :user }
  let(:admin)            { create :admin_user }
  let(:author)           { create :author_user }
  let(:other_author)     { create :author_user }
  let(:other_post)       { create :post, user: other_author }
  let(:posts)            { create_list(:post, 15, user: author) }
  let(:unpublished_post) { create :post, user_id: author.id, published_at: nil }

  permissions :update?, :show?, :destroy? do

    it "deny access if user is not an admin or the post owner" do
      expect(subject).not_to permit(user, unpublished_post)
      expect(subject).not_to permit(other_author, unpublished_post)
    end

    it "allow access if user is admin" do
      expect(subject).to permit(admin, unpublished_post)
    end

    it "allow access if user is the post author" do
      expect(subject).to permit(author, unpublished_post)
    end
  end

  permissions :index? do
    it "allow anyone to access published posts" do
      expect(Forge::PostPolicy::Scope.new(user, Forge::Post.all).resolve).to include posts[0]
    end

    it "deny guest users access to unpublished posts" do
      expect(Forge::PostPolicy::Scope.new(user, Forge::Post.all).resolve).not_to include unpublished_post
    end

    it "deny authors access to other author's posts" do
      expect(Forge::PostPolicy::Scope.new(author, Forge::Post.all).resolve).not_to include other_post
    end
  end

  permissions :create? do
    it "allow access if user is admin or author" do
      expect(subject).to permit(author, Forge::Post.new)
      expect(subject).to permit(admin, Forge::Post.new)
    end

    it "deny access if user is not admin or author" do
      expect(subject).not_to permit(user, Forge::Post.new)
    end
  end
end