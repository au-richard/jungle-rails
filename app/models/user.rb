class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: {minimum: 6}
  
  def self.authenticate_with_credentials(email, password)
    user = self.find_by_email(email.downcase.strip)
    if user and user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
