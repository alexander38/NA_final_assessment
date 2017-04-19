class Authentication < ApplicationRecord
	# In this example you are trying to create Authentication object without a User,
	# that's why you get "Validation failed: User must exist".
	belongs_to :user, optional: true

  def self.create_with_omniauth(auth_hash)
    create! do |auth|
      auth.provider = auth_hash["provider"]
      auth.uid = auth_hash["uid"]
      auth.token = auth_hash["credentials"]["token"]
    end
  end

  def update_token(auth_hash)
    self.token = auth_hash["credentials"]["token"]
    self.save
  end

end
