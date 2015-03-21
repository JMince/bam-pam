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

    describe "#memberships" do
      it "returns all associated memberships" do
        user = create_user
        club = Club.create!(name: "Ultimate Frisbee")
        membership = Membership.create!(club_id: club.id, user_id: user.id)

        expect(user.memberships).to eq [membership]
      end
    end
  end

  describe "validations" do
    it "is valid with a name" do
      user = User.new(name: "Bobby", password: "password")
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = User.new(name: nil, password: "password")
      user.valid?
      expect(user.errors[:name]).to eq(["can't be blank"])
    end
  end
end
