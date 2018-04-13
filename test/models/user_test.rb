require "test_helper"

describe User do
  describe "validations" do
    before do
      @user = User.new(name: "Anne")
    end

    it "can be created with all required fields" do
      result = @user.valid?
      result.must_equal true
    end

    it "is invalid without a name" do
      @user.name = nil

      result = @user.valid?

      result.must_equal false
      @user.errors.messages.must_include :name
    end
  end

  describe "relations" do
    before do
      @user = User.new(name: "Anne")
    end

    
  end
end
