class Country < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [ :slugged ]
  
  belongs_to :continent
  has_many :spots
  
end
