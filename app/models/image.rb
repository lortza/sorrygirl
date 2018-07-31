class Image

  def self.select
    self.image_file_names.sample
  end

  private
  
  def self.image_file_names
    filepaths = self.retrieve_image_filepaths
    filepaths.map { |path| path.match(/#{images_directory}(.*)/)[1] }
  end

  def self.retrieve_image_filepaths
    Dir.glob("*#{images_directory}*.{jpg,png,jpeg}")
  end

  def self.images_directory
    '/assets/images/'
  end

end
