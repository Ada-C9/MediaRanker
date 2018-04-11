class VotesController < ApplicationController
  def index
    @vote = Votes.all
  end

#controllers are only for talking to web browsers


end
