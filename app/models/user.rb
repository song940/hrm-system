class User < ActiveRecord::Base

  has_many :msg , :dependent => :destroy,:foreign_key => :sender


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  
  validates :username,  presence: true ,  uniqueness: true,  length: { maximum: 50 }
  validates :email,     presence: true ,  uniqueness: true,  format: { with: VALID_EMAIL_REGEX }
  validates :password,  presence: true


  before_save { email.downcase! }
	before_create :generate_default_name
  
	def User.encrypt(password)
      Digest::SHA1.hexdigest(password.to_s)
  end
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def authenticate(password)
  	self.password == password
  end

  def to_param
    username
  end

  def admin?
    status == 10
  end

private

  def generate_default_name
    self.username =  email[/[^@]+/]
    self.fullname =  email[/[^@]+/]
  end
end
