require "test_helper"

describe Work do
  describe "validations" do
    before do
      @work = Work.new
    end

    it "is valid when a work has a title " do

    end

    it "is valid when a work has a unique title" do

    end

    it "is invalid when a work does not have a title" do

    end

    it "is invalid when a work has a deplicate title" do

    end
  end

  describe "relations" do
    before do
      @work = works(:one)
    end

    it "is valid when a work connects votes" do
      vote = Vote.first
      @work.votes << vote

      @work.vote_ids.must_include vote.id
    end
  end

  describe "self.show_spotlight" do
  end

  describe "self.show_albums" do

  end

  describe "self.show_books" do

  end

  describe "self.show_movies" do
    
  end
end
