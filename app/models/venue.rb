class Venue < ActiveRecord::Base
  attr_accessible :city, :health_rating, :health_rating_date, :latitude, :longitude, :name, :postcode, :review, :avg_star_rating, :street
	has_many :reviews, order: 'updated_at desc'
#    has_many :reviewers, :through => :reviews, :source => :users
end
