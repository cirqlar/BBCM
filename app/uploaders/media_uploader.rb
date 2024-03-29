# encoding: utf-8

class MediaUploader < CarrierWave::Uploader::Base
  include ::CarrierWave::Backgrounder::Delay
  include ::CarrierWave::FFMPEG

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  process encode_video: [:mp4], :if => :video?
  process encode_audio: [:mp3], :if => :audio?

  version :webm, :if => :video? do
    process encode_video: [:webm]
    def full_filename(for_file)
      parent_name = super(for_file)
      ext         = File.extname(parent_name)
      base_name   = parent_name.chomp(ext)
      base_name + ".#{version_name}"
    end
  end

  version :ogv, :if => :video? do
    process encode_video: [:ogv]
    def full_filename(for_file)
      parent_name = super(for_file)
      ext         = File.extname(parent_name)
      base_name   = parent_name.chomp(ext)
      base_name + ".#{version_name}"
    end
  end

  version :wav, :if => :audio? do
    process encode_audio: [:wav]
    def full_filename(for_file)
      parent_name = super(for_file)
      ext         = File.extname(parent_name)
      base_name   = parent_name.chomp(ext)
      base_name + ".#{version_name}"
    end
  end

  # Choose what kind of storage to use for this uploader:
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  def content_type_whitelist
    /audio\/|video\//
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  protected
    def video?(new_file = "")
      return true if model.content_type == 'video'
    end

    def audio?(new_file = "")
      return true if model.content_type != 'video'
    end
end
