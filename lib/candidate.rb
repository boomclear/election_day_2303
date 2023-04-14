class Candidate
  attr_reader :votes
  def initialize(details)
    @details = details
    @votes = 0
  end

  def name
    @details[:name]
  end

  def party
    @details[:party]
  end

  def vote_for!
    @votes += 1
  end
end