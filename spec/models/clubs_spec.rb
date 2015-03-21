require 'rails_helper'

describe Club do
  describe "validations" do
    it "is valid with a name" do
      club = Club.create!(name: "Hiking")
      expect(club).to be_valid
    end

    it "is invalid without a name" do
      club = Club.new(name: nil)
      club.valid?
      expect(club.errors[:name]).to eq(["can't be blank"])
    end
  end

  describe "associations" do
    describe "#users" do
      it "returns all associated users" do
        club = Club.create!(name: "Ultimate Frisbee")
        user = create_user
        Membership.create!(club_id: club.id, user_id: user.id)

        expect(club.users).to eq [user]
      end
    end

    describe "#memberships" do
      it "returns all associated memberships" do
        user = create_user
        club = Club.create!(name: "Ultimate Frisbee")
        membership = Membership.create!(club_id: club.id, user_id: user.id)

        expect(club.memberships).to eq [membership]
      end
    end
  end
end
