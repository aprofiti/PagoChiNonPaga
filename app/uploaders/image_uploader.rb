=begin
Copyright 2017 Alessandro Profiti, Gabriele Restuccia, Lorenzo Ricelli.

This file is part of PagoChiNonPaga.

PagoChiNonPaga is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

PagoChiNonPaga is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
=end

class ImageUploader < CarrierWave::Uploader::Base

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  include CarrierWave::MiniMagick

  # TODO: Sistemare risoluzione
  process crop: [640,480], :if => :checkModelProdotto
  process crop: [1920,600], :if => :checkModelImpresa
  #process crop: [1920,1080]
  process :quality => 70

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # White list of extensions which are allowed to be uploaded.
  def extension_whitelist
     %w(jpg jpeg png)
  end

  # White list of types
  def content_type_whitelist
    /image\//
  end

  # Override the filename of the uploaded files
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    if model.class.name == "Prodotto"
      ActionController::Base.helpers.asset_path("template/" + [version_name, "missing.png"].compact.join('_'))
    else
      ActionController::Base.helpers.asset_path("template/" + [version_name, "Sfondo Negozio.png"].compact.join('_'))
    end
  end

  private
  def checkModelImpresa(impresa)
    model.class.name == "Impresa"
  end

  private
  def checkModelProdotto(prodotto)
    model.class.name == "Prodotto"
  end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end



end
