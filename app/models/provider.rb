class Provider < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  include Humanizer
  attr_accessor :bypass_humanizer
  require_human_on :create, unless: :bypass_humanizer
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true, length: {minimum:2, maximum: 50}
  validates :last_name, presence: true, length: {minimum:2, maximum: 50}
  validates :birthdate, presence: true
  validates :zip, presence: true, length: {is:5}
  validates :address1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :phone, presence: true
  validate :dob_check, on: :create
  validates :filename, allow_blank: true, format:
                            { with: %r{\.gif|jpg|png}i, message: 'incorrect format'}
  validates_acceptance_of :terms_of_service, acceptance: true
  validates_format_of :city, with: ->(provider) {/\A[a-zA-Z ]*\z/i}
  validates_size_of :profile_image, maximum: 2.megabytes, message: "too large. Please limit to 2MB"
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

  def profile_img=(input_data)
    self.filename = input_data.original_filename
    self.content_type = input_data.content_type.chomp
    self.profile_image = input_data.read
    #if self.profile_image.empty?
      #self.profile_image = 
    #end
  end
  private

  def dob_check
    if birthdate > 18.years.ago.to_date
      errors[:base] << "Must be 18 years of age to create an account. Those under 18 must have parent or guardian assistance."
    end
  end
end
