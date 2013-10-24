class User < ActiveRecord::Base

  has_many :notifictions , :dependent => :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  
  validates :username,  presence: true ,  uniqueness: true,  length: { maximum: 50 }
  validates :email,     presence: true ,  uniqueness: true,  format: { with: VALID_EMAIL_REGEX }
  validates :password,  presence: true


	before_save { self.email = email.downcase }
  before_update :generate_secure_password
	before_create :generate_secure_password
  before_create :generate_default_name

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

  def generate_default_name
    self.name = self.username
  end
end
