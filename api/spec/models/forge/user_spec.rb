require 'rails_helper'

describe Forge::User, type: :model do
  let!(:user){ create :user }

  it "interpolates the full name" do
    expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
  end
end
