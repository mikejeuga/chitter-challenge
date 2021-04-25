require "peep"

describe Peep do
  context "#initialize" do
    it "should have text, a username, and id and timestamp " do
      peep_1 = Peep.new(id: 78, message: "Hi, my name is Mike.", create_date: "2021-04-23T00:00:00+00:00")
      expect(peep_1.message).to eq("Hi, my name is Mike.")
      expect(peep_1.create_date).to eq("2021-04-23T00:00:00+00:00")
    end
  end

  context ".all" do
    it "should return all the available peeps" do
      add_peeps
      expect(Peep.all[0].message).to eq "I am feeling good today."
    end
  end

  context ".create" do
    it "should create a new peep in the db" do
      text = "This is the new data"
      expect { Peep.create(message: text) }.to change { Peep.all.length }.by 1
    end
  end
end