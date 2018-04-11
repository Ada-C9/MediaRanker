require "test_helper"

describe User do

  describe "validations" do

    before do
      @user = User.create!(name: 'test user')
    end

    it "can be created" do
      result = @user.valid?

      result.must_equal true
    end

    it "is invalid without a name" do
      @user.name = nil

      result = @user.valid?

      result.must_equal false
    end

    it "cannot be created if another user with the same name exists" do
      duplicate_user = User.new(name: 'test user')

      result = duplicate_user.valid?

      result.must_equal false
    end

  end

  # describe "#created_date" do
  #   new_user = User.create(name: 'test user')
  #
  #   result = new_user.created_date
  #
  #   result.must_equal Date.today
  # end

end
