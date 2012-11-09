require 'spec_helper'

describe User do
  before(:each) do
    @attr = { 
      :email => "example@example.com",
      :password => "password",
      :password_confirmation => "password"
    }
  end
  
  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end
  
  it "should require an email address" do

  end
  
  it "should reject invalid email address" do
    
  end
  
end
