class Client < ActiveRecord::Base
  include Humanizer
  has_many :reviews, dependent: :destroy
  attr_accessor :bypass_humanizer
  require_human_on :create, unless: :bypass_humanizer
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true, length: {minimum:2, maximum: 50}
  validates :last_name, presence: true, length: {minimum:2, maximum: 50}
  validates :birthdate, presence: true
  validates :zip, presence: true, length: {is:5}
  validates :address1, presence: true
  #validates :city, presence: true
  validates :state, presence: true
  validate :validate_phone, on: [:create, :update] #:phone, presence: true, length: {is: 10, wrong_length: "Phone Number must have 3 digit area code followed by 7 digit number"}
  validate :dob_check, on: :create
  validates_acceptance_of :terms_of_service, acceptance: true
  validates_format_of :city, with: ->(client) {/\A[a-zA-Z ]*\z/i}
  include ActionView::Helpers::NumberHelper
  before_save :run_formatters
  def run_formatters
    self.first_name = self.first_name.titleize
    self.last_name = self.last_name.titleize
    self.phone = number_to_phone(self.phone, area_code: true)
    self.address1 = self.address1.titleize
    self.city = self.city.titleize
    self.state = self.state.titleize
  end

  def validate_phone
    if phone.gsub(/\D/, "").length != 10
      errors[:base] << "Phone Number must have 3 digit area code followed by 7 digit number"
    else
      self.phone = number_to_phone(phone, area_code: true)
    end

    if !alt_phone.blank?
      if alt_phone.gsub(/\D/, "").length != 10
        errors[:base] << "Alternate Phone Number must have 3 digit area code followed by 7 digit number"
      else
        self.alt_phone = number_to_phone(alt_phone, area_code: true)
      end
    end
  end
  private

  def dob_check
    if birthdate > 18.years.ago.to_date
      errors[:base] << "Must be 18 years of age to create an account. Those under 18 must have parent or guardian assistance."
    end
  end

end
