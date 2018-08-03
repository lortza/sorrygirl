require "rails_helper"

RSpec.describe Image, :type => :model do
  describe '.sample' do
    it 'returns a single file name' do
      filenames = ['image.jpg', 'image.jpg']
      allow(Image).to receive(:image_file_names).and_return(filenames)

      expect(Image.sample).to eq('image.jpg')
    end
  end
end
