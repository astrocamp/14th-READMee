# frozen_string_literal: true

class User < ApplicationRecord
  before_save :set_account

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, 
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_one :profile
  has_one :company
  has_many :comments
  has_many :resumes
  has_many :articles
  has_many :like_logs
  has_many :liked_articles, source: :article, through: :like_logs
  has_many :job_matchings
  has_many :jobs, through: :job_matchings
  enum role: { job_seeker: 0, employer: 1, admin: 2 }

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    user ||= User.create(
      email: data['email'],
      account: data['account'] || data['email'].split('@').first,
      password: Devise.friendly_token[0, 20],
      confirmed_at: Time.now.utc
    )
    user
  end

  def liked?(record)
    liked_articles.include?(record)
  end

  def like!(record)
    liked_articles << record
  end  
  
  def unlike!(record)
    liked_articles.destroy(record)
  end  

  def set_account
    self.account = email.split('@').first if email.present?
  end

  def role_unset?
    role == 'nil'
  end
  
  def admin?
    role == 'admin'
  end

  def employer?
    role == 'employer'
  end

  def job_seeker?
    role == 'job_seeker'
  end

  def company?
    company.present?
  end
end
