require "rails_helper"

describe Membership do
  describe "associations" do
    describe "#clubs" do
      it "returns all associated clubs" do
        club = Club.create!(name: "Ultimate Frisbee")
        user = create_user
        membership = Membership.create!(club_id: club.id, user_id: user.id)

        expect(membership.club).to eq club
      end
    end

    describe "#memberships" do
      it "returns all associated memberships" do
        user = create_user
        club = Club.create!(name: "Ultimate Frisbee")
        membership = Membership.create!(club_id: club.id, user_id: user.id)

        expect(membership.user).to eq user
      end
    end
  end
end
