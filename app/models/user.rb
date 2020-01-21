# frozen_string_literal: true

class User < ApplicationRecord
  has_many :articles
  attr_accessor :remember_token
  before_create :remember
  before_save :d_email
  validates :name, presence: true, length: { maximum: 50 }
  RGX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freezes
  validates :email, presence: true, format: { with: RGX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def remember
    self.remember_token = SecureRandom.urlsafe_base64
    self.remember_digest = User.digest(remember_token)
  end

  def forget
    self.remember_digest = nil
    # update_attribute(:remember_digest, nil)
  end

  private

  def d_email
    self.email = email.downcase
  end
end
