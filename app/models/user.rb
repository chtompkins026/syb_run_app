class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email, :name
  validate :password_or_omniauth
  validates_uniqueness_of :email, :name
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: " is not valid. Please add a valid email"


  private

    def password_or_omniauth
      return if (!password.nil? || (!provider.nil? && !uid.nil?))
      #errors.add(:password, "can't be empty") 
    end

  end
