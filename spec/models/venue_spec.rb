require 'spec_helper'

describe Venue do
  it "has a valid factory" do
    FactoryGirl.create(:venue).should be_valid
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:venue, :name => nil).should_not be_valid
  end
  
  it "should reject duplicate names" do
    venue = Factory(:venue)
  Factory(:name, venue: venue, city: "Aberdeen", name: "ABC Bar")
  Factory.build(:name, venue: venue, city: "Aberdeen", name: "ABC Bar").should_not be_valid
  end
    
  it "is invalid without a latitude" do
    FactoryGirl.build(:venue, :latitude => nil).should_not be_valid
  end
  
end