class TopTensController < ApplicationController
  def index
    works = Work.all

    @top_work = (works.sort_by { |work| work.votes.count }).last
  end
end
