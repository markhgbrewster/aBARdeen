require 'spec_helper'

describe Review do
  it "has a valid factory" do
    FactoryGirl.create(:review).should be_valid
  end
  
  it "is invalid without a summary" do
    FactoryGirl.build(:review, :review_summary => nil).should_not be_valid
  end
    
  it "is invalid without a review text" do
    FactoryGirl.build(:review, :review_text => nil).should_not be_valid
  end
  
    it "is invalid without a star rating" do
    FactoryGirl.build(:review, :star_rating => nil).should_not be_valid
  end
  
end