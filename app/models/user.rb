class User < ApplicationRecord
	has_secure_password

	validates :email, presence: true, uniqueness: true
  validates :password, presence: true

	has_many :authentications, :dependent => :destroy


  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.password = SecureRandom.hex(6)
      u.authentications<<(authentication)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

end
