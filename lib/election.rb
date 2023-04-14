class Election
  attr_reader :year, :races, :candidates
  def initialize(year)
    @year = year
    @races = []
    @candidates = []
    @vote_counts = {}
    @open = true
  end

  def add_race(race)
    add_candidates(race)
    @races << race
    @races
  end

  def add_candidates(race)
    @candidates << race.candidates
    @candidates.flatten!
  end

  def add_votes
    @candidates.each do |candidate|
      @vote_counts[candidate.name] = candidate.votes
    end
  end
  
  def vote_counts
    add_votes
    @vote_counts
  end

end