require "test_helper"

describe Work do

  describe "validations" do

    it "must have a title" do
      new_work = Work.new

      result = new_work.valid?

      result.must_equal false
    end

  end # validationts

  describe "relationships" do

    it "connects vote and vote id" do

      vote_one = votes(:vote_one)

      poodr = works(:poodr)

      poodr.votes.must_include vote_one

    end

    it "connects users and users' ids" do

      poodr = works(:poodr)

      voters = [users(:user_one), users(:user_two)]

      users = poodr.votes.map do |vote|
        vote.user
      end

      users_included = false

      users.each do |user|
        users_included = voters.include?(user)
      end

      users_included.must_equal true

    end

  end # relationships

  describe "business logic" do

    describe "#upvote" do



    end # upvote

    describe "#top_movies" do

      it "returns at most 10 works" do
        top_movies = Work.top_movies
        top_movies.length.must_be :<=, 10
      end

      it "returns only movies" do

        top_movies = Work.top_movies

        all_movies = false

        top_movies.each do |movie|
          all_movies = movie.category == "movie"
        end

        all_movies.must_equal true

      end

      it "returns the top ten movies with the highest votes in descending order" do

        movies_with_votes = Work.where(category: "movie")

        movies_with_votes.delete(works(:star_wars))

        top_movies = Work.top_movies

        movies_with_votes.each do |movie|
          top_movies.must_include movie
        end

        top_movies.first.must_equal works(:spidey)

      end

    end # top_movies

  end # business logic

end
