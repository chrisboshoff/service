require 'securerandom'

class User < ActiveRecord::Base
  has_one :organisation
  
  attr_accessor :password
  before_save :encrypt_password
  before_create :set_verification_code
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :name
  validates_uniqueness_of :email, :case_sensitive => false
  
  def self.authenticate(email, password)
    user = includes(:organisation).find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def self.verify(email, verification_code)
    user = includes(:organisation).find_by_email(email)
    if user && user.verification_code == verification_code
      user.update(verification_code: "", verified: true)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def set_verification_code
    self.verification_code = SecureRandom.urlsafe_base64(16)
  end
end
