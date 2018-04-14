require "test_helper"
require 'pry'

describe Work do
  let(:work) { Work.find_by(title:"Sound of Nigera") }

  it "must be valid" do
    value(work).must_be :valid?
  end

  it "must return all expected fields" do
    value(work.title).must_equal "Sound of Nigera"
    value(work.creator).must_equal "Jidenna"
    value(work.publication_year).must_equal "2016"
    value(work.description).must_equal "Hip hop classic"
  end

  it "Must be able to show associated users" do
    user = User.create(name:"Noe Body")
    a_vote = Vote.create(user_id: user.id, work_id: work.id)

    work.votes.count.must_equal 1
    work.votes[0].user_id.must_equal user.id

  end

  it "Must be able to display total votes" do
    user = User.create(name:"Noe Body")
    second_user = User.create(name:"AH AHHH!!")


    a_vote = Vote.create(user_id: user.id, work_id: work.id)
    sec_vote = Vote.create(user_id: second_user.id, work_id: work.id)

    work.votes.count.must_equal 2
  end

  it "An empty work will not be saved for title" do
      work = Work.new
      work[:category] = 'Album'
      work[:creator] = 'Beyonce'
      work[:publication_year] = '2004'
      work[:description] = "Great album"

      assert_not work.valid?
  end


  it 'An empty string will not be saved for title' do
      work = Work.new
      work[:title] = ''
      work[:category] = 'Album'
      work[:creator] = 'Beyonce'
      work[:publication_year] = '2004'
      work[:description] = "Great album"

      assert_not work.valid?
  end

  it 'A nil input will not be saved for title' do
      work = Work.new
      work[:title] = nil
      work[:category] = 'Album'
      work[:creator] = 'Beyonce'
      work[:publication_year] = '2004'
      work[:description] = "Great album"

      assert_not work.valid?
  end

  it 'Only work items with unique title will be saved' do
    work = Work.new
    work[:title] = "Just a title"
    work.save

    repeated_title = Work.new
    repeated_title.title = "Just a title"

    assert_not repeated_title.valid?

  end

  it 'will return the highest rated work item' do
    user = User.create(name:"Noe Body")
    second_user = User.create(name:"AH AHHH!!")

    a_vote = Vote.create(user_id: user.id, work_id: work.id)
    sec_vote = Vote.create(user_id: second_user.id, work_id: work.id)

    highest_rated_work = Work.highest_rated_work
    highest_rated_work.title.must_equal "Sound of Nigera"
  end

  it 'work at the top of featured page will have highest votes' do
      user = User.create(name:"Noe Body")
      second_user = User.create(name:"Clair Noelle")
      third_user = User.create(name:"Phonelle Reialle")
      fourth_user = User.create(name:"Riri Gydyl")
      fifth_user = User.create(name:"Filla Rilla")

      work = Work.find_by(title: "Dangerous in Love")
      work_other = Work.find_by(title: "Fire and Fury")

      vote = Vote.create(user_id:user.id, work_id:work.id)
      second_vote = Vote.create(user_id:second_user.id,work_id:work_other.id)
      third_vote = Vote.create(user_id:third_user.id,work_id:work.id)
      fourth_vote = Vote.create(user_id:fourth_user.id,work_id:work_other.id)
      fifth_vote = Vote.create(user_id:fifth_user.id,work_id:work.id)

      binding.pry
      Work.top_ten.size.must_equal 10
      Work.top_ten[0].title.must_equal "Dangerous in Love"
      Work.top_ten[1].title.must_equal "Fire and Fury"

    end





  end
