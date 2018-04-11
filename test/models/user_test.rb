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

  it "User is able to cast a vote" do
    #user begins with votes of 0
    value(user.votes.count).must_equal 0
    temp_work = Work.first

    #assign a work
    user.works << temp_work

    #vote should be increased
    value(user.votes.count).must_equal 1
  end

  it "User is able to cast multiple votes" do
    value(user.votes.count).must_equal 0
    temp_work = Work.find_by(title: "Dangerous in Love")
    second_work = Work.find_by(title: "Sound of Nigera")
    third_work = Work.find_by(title: "Malibu")


    user.works << temp_work
    user.works << second_work
    user.works << third_work

    value(user.votes.count).must_equal 3
  end
  # it "User is unable to vote for the same Work more than once" do
  #   #have the user vote, an error should be created when the same work is voted again
  #   get_out = Work.find_by(title:"Get Out")
  #   user.works << get_out
  #   (user.works << get_out).valid? false
  #
  # end

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


end
