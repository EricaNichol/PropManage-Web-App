class Listing < ActiveRecord::Base
  belongs_to :user

  mount_uploader :image, ImageUploader


  def full_address
    "#{suite_no} #{address}, #{city}, #{postal}, #{country}"
  end
end
