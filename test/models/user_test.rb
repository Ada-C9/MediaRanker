require "test_helper"
require 'pry'
describe User do

  let(:user) { User.find_by(name: "Felix Cat")}
  it "must be valid" do
    value(user).must_be :valid?
  end

  it "must return all expected fileds" do
    value(user.name).must_equal "Felix Cat"
    value(user.date_joined).must_equal  "5/5/2008"
  end

  it "User is able to cast a vote and display count" do
    value(user.votes.count).must_equal 0
    temp_work = Work.first
    a_vote = Vote.create(user_id: user.id, work_id: temp_work.id)

    value(user.votes.count).must_equal 1
    value(user.votes[0].user_id).must_equal user.id
    value(user.votes[0].work_id).must_equal temp_work.id
  end

  it "User is able to cast many votes and display count" do
    value(user.votes.count).must_equal 0
    temp_work = Work.find_by(title: "Dangerous in Love")
    second_work = Work.find_by(title: "Sound of Nigera")
    third_work = Work.find_by(title: "Malibu")

    first_vote = Vote.create(user_id: user.id, work_id: temp_work.id)
    second_vote = Vote.create(user_id: user.id, work_id: second_work.id)
    third_vote = Vote.create(user_id: user.id, work_id: third_work.id)

    value(user.votes.count).must_equal 3
  end


    it "User is able to display associated works" do
      value(user.works.count).must_equal 0
      dangerous_in_love = Work.find_by(title: "Dangerous in Love")
      sound_of_nigeria  = Work.find_by(title: "Sound of Nigera")

      user.works << dangerous_in_love
      user.works << sound_of_nigeria

      value(user.works.count).must_equal 2
      value(user.works.where(title: "Dangerous in Love").first.title).must_equal "Dangerous in Love"
      value(user.works.where(title: "Sound of Nigera").first.title).must_equal "Sound of Nigera"
    end

    it 'An empty input will violate the presence validation' do
        user = User.new()
        assert_not user.valid?
    end

    it 'An empty string input will violate the presence the validation' do
      user = User.new(name:'')
      assert_not user.valid?
    end

    it 'A nill input will violate the presence validation' do
        user = User.new(name:nil)
        assert_not user.valid?
    end




end
