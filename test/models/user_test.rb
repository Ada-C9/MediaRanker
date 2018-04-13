require "test_helper"

describe User do
    let(:user) { User.new(name: "Kainin") }

    it "must be valid" do
      value(user).must_be :valid?
    end

    it "must be invalid without a name" do
      user.name = nil
      value(user).wont_be :valid?
    end

    it "validates one vote per work" do


    end

    it "must be valid with a supported category type" do

    end

  describe 'Joined' do
    let(:user) { User.new(name: "Kainin") }

    it "must return the user start date" do
      user.joined = "04-01-2018"

      value(user).joined.must_equal value(user).created_at
    end
  end
end
