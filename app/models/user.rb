class User < ActiveRecord::Base

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX =/\d{2}\d{5}\d{4}\b/
  before_save{ self.email = email.downcase }

  validates :name,presence: true
  validates :email,presence: true,length: {maximum: 50}, format: {with: VALID_EMAIL_REGEX},  uniqueness: {case_sensitive: false}
  validates :phone,presence: true, length: {minimum: 11}, format: {with: VALID_PHONE_REGEX}
  validates :gender,presence:true
  validates_inclusion_of :gender, :in => %w(m f)
  validates :preference,presence: true
  validates_inclusion_of :preference, :in => %w(a b ab)
  validates :inclusion,presence: true
  validates_inclusion_of :inclusion, :in => %w(sim nao)
  has_secure_password
  validates :password,length: {minimum: 6},presence:true
  validates :ticket,length:{minimum: 10},presence: true
end
