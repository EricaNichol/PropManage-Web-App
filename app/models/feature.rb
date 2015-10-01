class Feature < ActiveRecord::Base

  has_many :listings, through: :featurings
  has_many :featurings, dependent: :destroy
end
