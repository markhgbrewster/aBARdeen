class Search < ActiveRecord::Base
  attr_accessible :name, :rating, :street, :venue_id
  
  def bars
    @bars ||= find_bars
  end
  
private

  def find_bars
    #doc = Nokogiri::Slop(open('http://ratings.food.gov.uk/OpenDataFiles/FHRS760en-GB.xml'))
    #bars=[]
    #doc.xpath('//establishmentdetail').each do |establishmentdetail|
    #bars = establishmentdetail.businessname.content.downcase.include? name.downcase
    #bars=bars.collect("lower(establishmentdetail.businessname.content) like ?", "%#{name.downcase}%") if name.downcase.present?
    #bars = bars.where("lower(addressline2) like ?", "%#{street.downcase}%") if street.downcase.present?
    #bars = bars.where("lower(addressline3) like ?", "%#{street.downcase}%") if street.downcase.present?
    #bars = bars.where("avg_star_rating >= ?", rating) if rating.present?
    #bars
    #end
  end
end
