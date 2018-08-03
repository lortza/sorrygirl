require "rails_helper"

RSpec.describe Image, :type => :model do
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

      expect(Image.image_file_names.any?('/ipsum/')).to be false
      expect(Image.image_file_names.first).to eq('image.jpg')
    end
  end
end
