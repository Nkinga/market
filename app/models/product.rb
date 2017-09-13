class Product < ApplicationRecord
  belongs_to :category
  belongs_to :vendor
  
  mount_uploader :picture, PictureUploader
  validates :summary, presence: true
  validates :description, presence: true
  validate :picture_size
  
  private
  
  # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
  
  
end
