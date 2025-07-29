class Category < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  mount_uploader :image, ImageUploader

  validate :category_name_must_be_present

  def category_name_must_be_present
    unless category_name.present?
      errors.add(:base, "Name category must be present")
    end
  end
end
