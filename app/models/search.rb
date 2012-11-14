class Search < ActiveRecord::Base
  attr_accessible :name, :rating, :street, :venue_id
  attr_accessor :venue
  
  def venues
    @venues ||= find_venues
  end
  
private

  def find_venues
    venues = Venue.order(:name)
   
    venues = venues.where("(name) like ?", "%#{name.upcase}%") if name.upcase.present?
    venues = venues.where("lower(address1 || address2 || address3 || address4) like ?", "%#{street.downcase}%") if street.downcase.present? 
    venues
  end
end
