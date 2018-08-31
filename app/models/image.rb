# frozen_string_literal: true

class Image
  IMAGES_DIRECTORY = '/assets/images/'
  ACCEPTABLE_FORMATS = %w[jpg jpeg png].freeze

  class << self
    def sample
      image_file_names.sample
    end

    private

    def image_file_names
      filepaths.map { |path| File.basename(path) }
    end

    def filepaths
      Dir.glob("*#{IMAGES_DIRECTORY}*.{#{ACCEPTABLE_FORMATS.join(',')}}")
    end
  end
end
