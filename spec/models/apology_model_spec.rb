require "rails_helper"

RSpec.describe Apology, :type => :model do
  let(:apology) { Apology.new(body: 'lorem', image: 'image.jpg') }
  character_max = Apology::CHARACTER_MAX
  string_at_char_max = 'x' * character_max
  string_over_char_max = 'x' * (character_max + 1)


  describe 'a valid apology' do
    it 'is not valid without a body' do
      apology.body = nil
      expect(apology).to_not be_valid
    end

    it 'is not valid without an image' do
      apology.image = nil
      expect(apology).to_not be_valid
    end

    it "permits up to #{character_max} characters in the body field" do
      apology.body = string_at_char_max
      expect(apology).to be_valid

      apology.body = string_over_char_max
      expect(apology).to_not be_valid
    end
  end

  it 'orders apologies by descending created_at' do
    apology1 = Apology.create!(image: 'image.jpg', body: 'first apology')
    apology2 = Apology.create!(image: 'image.jpg', body: 'second apology')
    expect(Apology.ordered).to eq([apology2, apology1])
  end

  it 'assigns an image on create' do
    filename = 'image.jpg'
    allow(Image).to receive(:sample).and_return(filename)

    apology = Apology.new(body: 'lorem ipsum')
    expect{apology.save}.to change{apology.image}.from(nil).to(filename)
  end

end
