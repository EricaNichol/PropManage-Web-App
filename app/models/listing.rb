class Listing < ActiveRecord::Base


  belongs_to :user

  mount_uploader :image, ImageUploader

  geocoded_by :full_address
  after_validation :geocode


  def full_address
    "#{suite_no} #{address}, #{city}, #{postal}, #{country}"
  end
end
