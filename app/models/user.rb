class User < ActiveRecord::Base
  after_initialize :default_values

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX =/\d{2} \d{5}\d{4}\b/
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
  validates :ticket,length:{minimum: 5},presence: true

  private
  def default_values
    self.ticket = SecureRandom.urlsafe_base64(nil, false)
  end
end
