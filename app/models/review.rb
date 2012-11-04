class Review < ActiveRecord::Base
  attr_accessible :review_summary, :review_text, :star_rating, :user_id, :venue_id
end
