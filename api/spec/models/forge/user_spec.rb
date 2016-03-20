require 'rails_helper'

describe Forge::User, type: :model do

  subject { Forge::User }

  let!(:user){ create :user }

  context "full name" do

    describe "first name and last name are present" do
      it "full name combines the first and last name" do
        expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
      end
    end
  end

  context "roles" do

    describe "when no role is specified" do

      it "gets a default role" do
        expect(user.role).to eq("user")
      end
    end

    describe "when a role is specified" do
      it "allows setting the role to admin" do
        user.update_attributes(:role => :admin)
        expect(user.reload.role).to eq("admin")
      end

      it "allows setting the role to reviewer" do
        user.update_attributes(:role => :reviewer)
        expect(user.reload.role).to eq("reviewer")
      end

      it "allows setting the role to author" do
        user.update_attributes(:role => :author)
        expect(user.reload.role).to eq("author")
      end

      it "does not allow the role to be grandmasterfunk" do
        expect { user.update_attributes(:role => :grand_master_funk) }
            .to raise_error ArgumentError, /'grand_master_funk' is not a valid role/
      end
    end
  end
end
