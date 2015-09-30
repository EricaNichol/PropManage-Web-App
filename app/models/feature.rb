class Feature < ActiveRecord::Base

  has_many :featurings, dependent: :destroy
  has_many :listings, through: :featurings
end
