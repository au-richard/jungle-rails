class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: {minimum: 6}
  validates :authenticate_with_credentials authentication: true
  
end
