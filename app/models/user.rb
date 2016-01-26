class User < ActiveRecord::Base
  
  has_secure_password
  validates :password, length: { minimum: 5, allow_blank: true }
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, 
    format: /\A\S+@\S+\z/,
    uniqueness: { case_sensitive: false }
  validates :username, presence: true,
    format: /\A[A-Z0-9]+\z/i,
    uniqueness: { case_sensitive: false }

  before_save :format_username
  before_save :format_email

  def self.authenticate(email_or_username, password)
    user = User.find_by(email: email_or_username) || User.find_by(username: email_or_username)
    user && user.authenticate(password)
  end #self.authenticate(email, password)
  
  def format_username
    self.username = username.downcase
  end #format_username

  def format_email
    self.email = email.downcase 
  end #format_email

  def to_param
    username
  end #to_param
    

end #User
