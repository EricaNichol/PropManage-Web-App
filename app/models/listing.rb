class Listing < ActiveRecord::Base

  belongs_to :user

  has_many :features, through: :featurings
  has_many :featurings, dependent: :destroy

  has_many :comments, as: :commentable

  mount_uploader :image, ImageUploader

  geocoded_by :full_address
  after_validation :geocode



  def full_address
    "#{suite_no} #{address}, #{city}, #{postal}, #{country}"
  end


end
