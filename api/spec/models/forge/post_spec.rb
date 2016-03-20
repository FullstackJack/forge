require 'rails_helper'

RSpec.describe Forge::Post, type: :model do

  context "validations" do

    it "is invalid without a title" do
      post = build(:post, title: nil)
      expect(post).not_to be_valid
      expect(post.errors[:title]).to include("can't be blank")
    end

    it "is invalid with a duplicate slug" do
      post = create :post, title: "Welcome To My Blog!"
      duplicate_post = build :post, title: post.title
      expect(duplicate_post).not_to be_valid
      expect(duplicate_post.errors[:slug]).to include("has already been taken")
    end
  end

  context "slug generation" do

    it "triggers set_default_slug before validation" do
      post = build :post
      expect(post).to receive(:set_default_slug)
      post.valid?
    end

    it "#set_default_slug" do
      post = create :post, title: "My first post"
      expect(post.slug).to eq("my-first-post")
    end
  end
end
