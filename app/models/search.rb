class Search < ActiveRecord::Base
  attr_accessible :name, :rating, :street, :venue_id
end
