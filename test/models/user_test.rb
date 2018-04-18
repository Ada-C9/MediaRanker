require "test_helper"

describe User do
  let(:user) { User.new }

  it "must be valid" do
    user = users(:peanut)
    value(user).must_be :valid?
  end

  it 'must have a username' do
    user = users(:inc_name)
    user.valid?.must_equal false
    user.errors.must_include :username
  end
end
