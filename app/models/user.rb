class User < ActiveRecord::Base
  validates :name,  presence: true,
                    length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  before_save { self.email = email.downcase }

  has_secure_password
  VALID_PASSW_REGEX = /\A(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[\x20-\x7E]+\z/
  validates :password,  length: { minimum: 6, maximum: 32 },
                        format: { with: VALID_PASSW_REGEX },
                        presence: true
end
