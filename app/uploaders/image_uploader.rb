# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def size_range
    (10.kilobytes)..(50_000.megabytes)
  end

  version :thumb do
    process resize_to_fit: [230, 330]
  end

  version :medium do
    process resize_to_fit: [300, 400]
  end

  version :full do
    process resize_to_fill: [800, 750]
  end

  def extension_allowlist
    %w[jpg jpeg gif png]
  end
end
