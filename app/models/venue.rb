class Venue < ActiveRecord::Base
  attr_accessible :city, :address, :health_rating, :health_rating_date, :latitude, :longitude, :name, :postcode, :review, :avg_star_rating, :street, :business_id, :address1, :address2, :address3, :address4
	has_many :reviews, order: 'updated_at desc'
  
   validates_uniqueness_of :business_id, :scope => :name
#    has_many :reviewers, :through => :reviews, :source => :users

acts_as_gmappable

def gmaps4rails_address
#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  "#{self.name}, #{self.address1}, #{self.address2}, #{self.address3}, #{self.address4}, #{self.postcode}"
end

end
