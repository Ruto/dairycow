class User < ApplicationRecord
  rolify
  has_secure_password

  #has_many :permissions
  #has_many :roles, through: :permissions

  validates :email, :username, :phone, presence: true, on: :create
  validates :email, :username, :phone, uniqueness: true
  validates :email, case_sensitive: false
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }

  before_save :downcase_email
  before_create :generate_confirmation_instructions


  def downcase_email
    self.email = self.email.delete(' ').downcase
  end

  def generate_confirmation_instructions
    self.confirmation_token = SecureRandom.hex(4)
    self.confirmation_sent_at = Time.now.utc
  end

  def confirmation_token_valid?
    (self.confirmation_sent_at + 14.days) > Time.now.utc
  end

  def mark_as_confirmed!
    self.confirmation_token = nil
    self.confirmed_at = Time.now.utc
    save
  end

end
