class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :generate_secure_password 

	def User.encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
  end
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def authenticate(password)
  	self.password == User.encrypt("pass#{password}word")
  end



private

  def generate_secure_password
    self.password = User.encrypt("pass#{self.password}word")
  end
end
