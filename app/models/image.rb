# frozen_string_literal: true

class Image
  IMAGES_DIRECTORY = '/assets/images/'
  ACCEPTABLE_FORMATS = %w[jpg jpeg png].freeze

  class << self
    delegate :sample, to: :image_file_names

    # I prefer this version over the rubocop suggestion to delegate
    # because its intention is more clear to me.

    # def sample
    #   image_file_names.sample
    # end

    private

    def image_file_names
      filepaths.map { |path| File.basename(path) }
    end

    def filepaths
      Dir.glob("*#{IMAGES_DIRECTORY}*.{#{ACCEPTABLE_FORMATS.join(',')}}")
    end
  end
end
