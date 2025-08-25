# frozen_string_literal: true

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def default_url(*_args)
    ActionController::Base.helpers.asset_path('avatar.png')
  end

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def size_range
    0..50.megabytes
  end

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  def extension_allowlist
    %w[jpg jpeg gif png]
  end
end
