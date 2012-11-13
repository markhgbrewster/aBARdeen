class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :avatar
  # attr_accessible :title, :body

  #validates :name, :presence => true
  #validates_uniqueness_of :name, :email, :case_sensitive => false

  if Rails.env.production?
  has_attached_file :avatar,

  :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :storage => :s3,
    :url => ":s3_domain_url",
    :path => "/:class/avatars/:id_:basename.:style.:extension",
    :s3_credentials => {
      :bucket            => ENV['S3_BUCKET_NAME'],
      :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
else
  has_attached_file :avatar,
   :styles => { :medium => "300x300>", :thumb => "100x100>" }

#Paperclip 3.0 introduces a non-backward compatible change in your attachment
#path. This will help to prevent attachment name clashes when you have
#multiple attachments with the same name. If you didn't alter your
#attachment's path and are using Paperclip's default, you'll have to add
#`:path` and `:url` to your `has_attached_file` definition. For example:
#
#    has_attached_file :avatar,
#      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
#      :url => "/system/:attachment/:id/:style/:filename"

  end
  validates_attachment_content_type :avatar, :content_type => ['image/jpg', 'image/jpeg', 'image/png', 'image/pjepg', 'image/x-png', 'image/pjpeg']


  has_many :reviews
  
  #validates :name, :presence => true
  #validates_uniqueness_of :name, :email, :case_sensitive => false
end
