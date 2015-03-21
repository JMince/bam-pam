require 'rails_helper'

describe Club do
  it "is valid with a name" do
    club = Club.create!(name: "Hiking")
    expect(club).to be_valid
  end

  it "is invalid without a name" do
    club = Club.create!(name: nil)
    club.valid?
    expect(club.errors[:name]).to eq("can't be blank")
  end
end
