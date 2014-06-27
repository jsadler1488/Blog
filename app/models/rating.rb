class Rating < ActiveRecord::Base
  belongs_to :provider
  validates :rating, numericality: {only_integer: true},
                     inclusion: {in: 1..5}
  
end
