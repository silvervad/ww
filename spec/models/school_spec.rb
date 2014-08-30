require 'spec_helper'

describe School do

  before do 
  	@school = School.new(name: "School 1", link: "http://dsdfsd.com", 
  		spot_id: 1, sports: 4, latitude: 55.2222, longitude: 44.3333, affiliation: 5)
  end

  subject { @school }

  it { should respond_to(:name) }
  it { should respond_to(:link) }
  it { should respond_to(:spot_id) }
  it { should respond_to(:sports) }
  it { should respond_to(:latitude) }
  it { should respond_to(:longitude) }
  it { should respond_to(:affiliation) }

  describe ", when name is not present," do
    before { @school.name = " " }
    it { should_not be_valid }
  end

  describe ", when name is too long," do
    before { @school.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe ", when link is not present," do
    before { @school.link = " " }
    it { should_not be_valid }
  end

  describe ", when spot is not present," do
    before { @school.spot_id = " " }
    it { should_not be_valid }
  end

  describe ", when sports is not present," do
    before { @school.sports = " " }
    it { should_not be_valid }
  end

  describe ", when latitude is not present," do
    before { @school.latitude = " " }
    it { should_not be_valid }
  end

  describe ", when longitude is not present," do
    before { @school.longitude = " " }
    it { should_not be_valid }
  end

  describe ", when affiliation is not present," do
    before { @school.affiliation = " " }
    it { should_not be_valid }
  end
end