class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true, length: {minimum:2, maximum: 50}
  validates :last_name, presence: true, length: {minimum:2, maximum: 50}
  validates :birthdate, presence: true
end
