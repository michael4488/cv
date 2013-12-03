class User < ActiveRecord::Base
  attr_accessible :name, :email, :dob, :password, :password_confirmation, :dob
  has_secure_password

  VALID_EMAIL_REGEX = /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i

  validates :name, presence: true, length: {maximum: 50, minimum: 5}
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  before_save :create_remember_token
  before_save { |u| u.email = email.downcase }

  def create_remember_token
    temp = ('A'..'Z').to_a + ('a'..'z').to_a
    temp.shuffle!
    temp = temp.join
    self.remember_token = temp[0..29]
  end
end
