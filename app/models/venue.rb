class Venue < ActiveRecord::Base
  attr_accessible :photo, :city, :address, :health_rating, :health_rating_date, :latitude, :longitude, :name, :postcode, :review, :avg_star_rating, :street, :business_id, :address1, :address2, :address3, :address4
	has_many :reviews, order: 'updated_at desc'
<<<<<<< HEAD
  
   validates :business_id, :uniqueness => true
   
=======

   #validates :business_id, :uniqueness => true

>>>>>>> e681238d8bf7c8a53cf4c8c08c113e8851358689
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

#Paperclip 3.0 introduces a non-backward compatible change in your attachment
#path. This will help to prevent attachment name clashes when you have
#multiple attachments with the same name. If you didn't alter your
#attachment's path and are using Paperclip's default, you'll have to add
#`:path` and `:url` to your `has_attached_file` definition. For example:
#
#    has_attached_file :photo,
#      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
#      :url => "/system/:attachment/:id/:style/:filename"

  end
  validates_attachment_content_type :photo, :content_type => ['image/jpg', 'image/jpeg', 'image/png', 'image/pjepg', 'image/x-png', 'image/pjpeg']


acts_as_gmappable

def gmaps4rails_address
#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  "#{self.name}, #{self.address1}, #{self.address2}, #{self.address3}, #{self.address4}, #{self.postcode}"
end

end
