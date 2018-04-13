require "test_helper"

describe User do
  let(:user) { User.new }

  it "must be valid" do
    user.name = "Pinky"
    value(user).must_be :valid?
  end

  it "must have a name" do
    user.name = "Woodchuck Coodchuck-Berkowitz"
    value(user).must_be :valid?
    user.name = nil
    value(user).must_be :invalid?
  end

  it "must have a name that is between one and forty characters long" do
    user.name = ""
    value(user).must_be :invalid?
    user.name = "123456789012345678901234567890123456789012"
    value(user).must_be :invalid?
    user.name = "Hollyhock Manheim-Mannheim-Guerrero-Robinson-Zilberschlag-Hsung-Fonzerelli-McQuack"
    value(user).must_be :invalid?
  end

  it "must have a unique name" do

    user.name = "Cuddlywhiskers"
    value(user).must_be :invalid?

    user.name = "Skinny Gina"
    value(user).must_be :invalid?

    user.name = "Crackerjack Sugarman"
    value(user).must_be :valid?

    user.name = "Skinny"
    value(user).must_be :valid?
  end
end
