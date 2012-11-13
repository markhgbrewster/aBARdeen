class Venue < ActiveRecord::Base
  attr_accessible :photo, :city, :address, :health_rating, :health_rating_date, :latitude, :longitude, :name, :postcode, :review, :avg_star_rating, :street, :business_id, :address1, :address2, :address3, :address4
	has_many :reviews, order: 'updated_at desc'
  
   validates :business_id, :uniqueness => true
   
#    has_many :reviewers, :through => :reviews, :source => :users

if Rails.env.production?
  has_attached_file :photo,

  :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :storage => :s3,
    :url => ":s3_domain_url",
    :path => "/:class/photos/:id_:basename.:style.:extension",
    :s3_credentials => {
      :bucket            => ENV['S3_BUCKET_NAME'],
      :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
else
  has_attached_file :photo,
   :styles => { :medium => "300x300>", :thumb => "100x100>" }

  end
  validates_attachment_content_type :photo, :content_type => ['image/jpg', 'image/jpeg', 'image/png', 'image/pjepg', 'image/x-png', 'image/pjpeg']



acts_as_gmappable

def gmaps4rails_address
#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  "#{self.name}, #{self.address1}, #{self.address2}, #{self.address3}, #{self.address4}, #{self.postcode}"
end

end
