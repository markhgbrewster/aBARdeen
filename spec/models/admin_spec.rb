require 'spec_helper'

describe Admin do
  before(:each) do
    @attr = { 
      :email => "admin@example.com",
      :password => "password",
      :password_confirmation => "password"
    }
  end
  
  it "should create a new instance given a valid attribute" do
    Admin.create!(@attr)
  end
  
    it "should require an email address" do

  end
  
  it "should reject invalid email address" do
    
  end
  
end
