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

    describe "#top_books" do

      it "returns at most 10 works" do
        top_books = Work.top_books
        top_books.length.must_be :<=, 10
      end

      it "returns only books" do

        top_books = Work.top_books

        all_books = false

        top_books.each do |movie|
          all_books = movie.category == "book"
        end

        all_books.must_equal true

      end

      it "returns the top ten movies with the highest votes in descending order" do

        books_with_votes = Work.where(category: "book")

        top_books = Work.top_books

        books_with_votes.each do |book|
          top_books.must_include book
        end

        top_books.first.must_equal works(:poodr)

      end

    end # top_books

    describe "#top_albums" do

      it "returns at most 10 works" do
        top_albums = Work.top_albums
        top_albums.length.must_be :<=, 10
      end

      it "returns only albums" do

        top_albums = Work.top_albums

        all_albums = false

        top_albums.each do |album|
          all_albums = album.category == "album"
        end

        all_albums.must_equal true

      end

      it "returns the top ten movies with the highest votes in descending order" do

        albums_with_votes = Work.where(category: "album")

        top_albums = Work.top_albums

        albums_with_votes.each do |album|
          top_albums.must_include album
        end

        top_albums.first.must_equal works(:mis_cuarenta)

      end

    end # top_albums

    describe "#top_work" do
      
      it "returns the work with the highest number of votes" do

        works = Work.all

        top = Work.new

        works.each do |work|
          if work.votes.count > top.votes.count
            top = work
          end
        end

        top.must_equal works(:mis_cuarenta)

        top_work = Work.top_work

        top_work.must_equal top

      end

    end # top_work

  end # business logic

end
