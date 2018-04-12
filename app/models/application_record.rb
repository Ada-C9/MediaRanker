class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def report_vote_tally(id_for_work)
    @media_vote_num = Vote.where(work_id: id_for_work).count
  end


end
