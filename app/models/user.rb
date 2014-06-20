class User < ActiveRecord::Base
  include Humanizer
  require_human_on :create
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true, length: {minimum:2, maximum: 50}
  validates :last_name, presence: true, length: {minimum:2, maximum: 50}
  validates :birthdate, presence: true
  validates :zip, presence: true, length: {is:5}
  validate :dob_check, on: :create
  
  before_save { |u| u.first_name = u.first_name.titleize }
  before_save { |u| u.last_name = u.last_name.titleize }
  private
  
  def dob_check
    if birthdate > 18.years.ago.to_date
      errors[:base] << "Must be 18 years of age to create an account. Those under 18 must have parent or guardian assistance."  
    end
  end
  
  
  
end
