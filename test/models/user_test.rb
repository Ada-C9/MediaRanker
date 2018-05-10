require "test_helper"

describe User do
  let(:user) { User.new(name: "Katherine") }

  it "must be valid" do
    value(user).must_be :valid?
  end

  it 'is valid with a user name that is more than 6 characters long' do
    value(user).must_be :valid?
    user.name = "KatherineJaneAda"
    user.save
    result = user.name
    result.must_equal "KatherineJaneAda"
    user.must_be :valid?
  end

  it 'wont be valid with a user name that is less than 6 characters long' do
    user.name = "Ada"
    user.save

    user.wont_be :valid?
  end
end
