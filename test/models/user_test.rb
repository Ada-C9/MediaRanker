require "test_helper"

describe User do

  describe "validations" do
    it "should be related to many votes " do
      user = users(:one)
      vote = Vote.first
      user.votes << vote

      user.vote_ids.must_include vote.id
    end
  end


  describe "methods in model" do
    it "shoul return a book when asked for the last published or first published book" do


    end

  end
end
