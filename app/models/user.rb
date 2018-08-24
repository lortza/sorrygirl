# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 5, allow_blank: true }
  validates :first_name, :last_name, presence: true
  validates :email,
            presence: true,
            format: /\A\S+@\S+\z/,
            length: { minimum: 5 },
            uniqueness: { case_sensitive: false }
  validates :username,
            presence: true,
            format: /\A[A-Z0-9]+\z/i,
            uniqueness: { case_sensitive: false }

  before_save :format_username
  before_save :format_email

  def format_username
    self.username = username.downcase
  end

  def format_email
    self.email = email.downcase
  end

  def to_param
    username
  end
end
