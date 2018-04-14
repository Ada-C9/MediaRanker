require "test_helper"

describe User do
  let(:user) { User.create name: "person"}

  describe "validations" do

    it "must be valid" do
      value(user).must_be :valid?
    end

    it "must have a name" do
      user.name = nil

      user.valid?.must_equal false
      user.errors.must_include :name
    end

    it "name must not be too short" do
      user.name = ""

      user.valid?.must_equal false
      user.errors.must_include :name

    end

    it "name must not be too long" do
      test_name = []
      30.times do |i|
        test_name << i
      end
      test_name = test_name.join

      user.name = test_name

      user.valid?.must_equal false
      user.errors.must_include :name
    end

  end

end
