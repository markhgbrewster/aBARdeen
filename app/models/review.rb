class Review < ActiveRecord::Base
  attr_accessible :review_summary, :review_text, :star_rating, :user_id, :venue_id

  belongs_to :venue
  belongs_to :user
  
end
