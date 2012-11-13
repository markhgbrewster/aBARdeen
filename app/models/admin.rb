class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  validates :email, :password, :presence => true
  validates :email,
            :format => {
              :with    => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i,
              }
end
