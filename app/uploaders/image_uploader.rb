class ImageUploader < CarrierWave::Uploader::Base

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  include CarrierWave::MiniMagick

  # TODO: Sistemare risoluzione
  process crop: [640,360], :if => :checkModelProdotto
  process crop: [1280,720], :if => :checkModelImpresa
  #process crop: [1920,1080]
  process :quality => 100

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
    if  model.class.name == "Prodotto"
      "/assets/template/missing.png"
    else
      "/assets/template/Sfondo Negozio.png"
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
