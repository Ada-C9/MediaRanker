require "test_helper"

describe User do

  describe "validations" do

    it "must have a username" do
      new_user = User.new

      result = new_user.valid?

      result.must_equal false
    end

  end # validations

end
