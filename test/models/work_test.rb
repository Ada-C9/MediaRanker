require "test_helper"

describe Work do
  before do
    @work = Work.first
  end

  it "can be created with all required fields" do
    # Act
    result = @work.valid?

    # Assert
    result.must_equal true
  end
end
