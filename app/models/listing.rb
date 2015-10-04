class Listing < ActiveRecord::Base

  belongs_to :user


  has_many :features, through: :featurings
  has_many :featurings, dependent: :nullify
  has_many :comments, as: :commentable

  mount_uploader :image, ImageUploader

  geocoded_by :full_address
  after_validation :geocode

  validates :description, presence: true
  validates :address, presence: true



  def full_address
    "#{suite_no} #{address}, #{city}, #{postal}, #{country}"
  end


end
