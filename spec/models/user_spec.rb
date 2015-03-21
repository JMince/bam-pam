require "rails_helper"

describe User do
  describe "associations" do
    describe "#clubs" do
      it "returns all associated clubs" do
        club = Club.create!(name: "Ultimate Frisbee")
        user = create_user
        Membership.create!(club_id: club.id, user_id: user.id)

        expect(user.clubs).to eq [club]
      end
    end

    describe "#clubs" do
      it "returns all associated clubs" do
        user = create_user
        club = Club.create!(name: "Ultimate Frisbee")
        membership = Membership.create!(club_id: club.id, user_id: user.id)

        expect(user.memberships).to eq [membership]
      end
    end
  end
end
