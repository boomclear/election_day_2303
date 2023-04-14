require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do 
  it "exists" do 
    election = Election.new("1980")

    expect(election).to be_a Election
  end

  it "has attributes" do 
    election = Election.new("1980")

    expect(election.year).to eq "1980"
  end

  it "can add and display races" do 
    election = Election.new("1980")
    race = Race.new("Texas Governor")
    race2 = Race.new("Florida Governor")
    
    expect(election.races).to eq []
    election.add_race(race)
    expect(election.races).to eq [race]
    election.add_race(race2)
    expect(election.races).to eq [race, race2]
  end

  it 'can display all candidates in an election' do
    election = Election.new("1980")
    race = Race.new("Texas Governor")
    race2 = Race.new("Florida Governor")
    
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race2.register_candidate!({name: "Roberto R", party: :republican})
    election.add_race(race2)
    election.add_race(race)

    expect(election.candidates).to eq [candidate2, candidate1]
  end

  it "can display all the votes in an election" do
    election = Election.new("1980")
    race = Race.new("Texas Governor")
    race2 = Race.new("Florida Governor")
    
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race2.register_candidate!({name: "Roberto R", party: :republican})
    election.add_race(race2)
    election.add_race(race)
    candidate1.vote_for!
    candidate1.vote_for!
    candidate1.vote_for!
    candidate1.vote_for!
    candidate1.vote_for!
    candidate2.vote_for!
    candidate2.vote_for!
    expect(election.vote_counts).to eq({"Diana D" => 5, "Roberto R" => 2})
  end
    
end