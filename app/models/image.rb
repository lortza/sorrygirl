class Image

  IMAGES_DIRECTORY = '/assets/images/'
  ACCEPTABLE_FORMATS = 'jpg,jpeg,png'

  def self.sample
    self.image_file_names.sample
  end

  private

  def self.image_file_names
    self.filepaths.map { |path| File.basename(path) }
  end

  def self.filepaths
    Dir.glob("*#{IMAGES_DIRECTORY}*.{#{ACCEPTABLE_FORMATS}}")
  end

end
