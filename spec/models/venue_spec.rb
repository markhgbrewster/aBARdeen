require 'spec_helper'

describe Venue do
  it "has a valid factory" do
    FactoryGirl.create(:venue).should be_valid
  end
  
  it "is invalid without a name" do
    
  end
  
  it "should reject duplicate names" do
      
  end
    
  it "is invalid without a rating" do
    
  end
  
end