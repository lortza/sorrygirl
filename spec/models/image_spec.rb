# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image, type: :model do
  acceptable_formats = Image::ACCEPTABLE_FORMATS

  describe '.sample' do
    it 'returns a single file name' do
      filenames = ['image.jpg', 'image.jpg']
      allow(Image).to receive(:image_file_names).and_return(filenames)

      expect(Image.sample).to eq('image.jpg')
    end
  end

  describe '.image_file_names' do
    it 'returns an array of image file basenames without the path' do
      filepaths = ['/ipsum/image.jpg', '/ipsum/image.pdf']
      allow(Image).to receive(:filepaths).and_return(filepaths)

      expect(Image.send(:image_file_names).any?('/ipsum/')).to be false
      expect(Image.send(:image_file_names).first).to eq('image.jpg')
    end
  end

  describe '.filepaths' do
    it "excludes formats other than #{acceptable_formats}" do
      expect(Image.send(:filepaths).exclude?('.pdf')).to be true
    end

    it "includes the acceptable formats of #{acceptable_formats}" do
      regex = /([^\.]+$)/
      extensions = Image.send(:filepaths).map { |path| path.match(regex)[1] }.uniq
      all_ext_valid = extensions.all? { |ext| acceptable_formats.include?(ext) }

      expect(all_ext_valid).to be true
    end
  end
end
