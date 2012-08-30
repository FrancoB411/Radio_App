require 'spec_helper'

describe Song do
  
  it "creates a song in the database" do
    lambda { FactoryGirl.create(:song) }.should change( Song, "count").by(1)
  end

  describe "validations" do
    
    before :each do
      @s = FactoryGirl.build(:song)
    end
    
    it "must have a name" do
      @s.name = ''
      @s.should_not be_valid
    end
     
    it "must have an artist" do
      @s.artist = nil
      @s.should_not be_valid
    end
  end

  it "belongs to an artist" do 
    Song.new.should respond_to(:artist)
  end

 
  describe "GET /songs" do
    it "has a /songs path" do
      get songs_path
      response.status.should be(200)
    end
  end
end
