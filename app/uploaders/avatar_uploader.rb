# frozen_string_literal: true

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def default_url(*args)
    ActionController::Base.helpers.asset_path("avatar.png")
  end

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fill: [100, 100]

  version :thumb do
    process resize_to_fill: [50, 50]
  end

  def extension_allowlist
    %w(jpg jpeg gif png)
  end
end
