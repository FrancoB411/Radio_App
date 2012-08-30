require 'spec_helper'

describe User do
  
  it "creates a user in the database" do
    lambda { FactoryGirl.create(:user) }.should change( User, "count").by(1)
  end

  describe "validations" do
    %w(name email).each do |attr|
      it "must have a #{attr}" do
        subject.send("#{attr}=", nil)
        should_not be_valid
      end
    end
  end

  it "has_many songs" do
    User.new.should respond_to(:songs)
  end

end