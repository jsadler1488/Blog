class Fund < ActiveRecord::Base
  belongs_to :client
  validates_acceptance_of :use_different_address
end