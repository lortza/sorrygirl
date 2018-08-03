require "rails_helper"

RSpec.describe Apology, :type => :model do

  character_max = 170
  string_at_char_max = 'x' * character_max
  string_over_char_max = 'x' * (character_max + 1)


  describe 'a valid apology' do
    it 'requires the image field' do
      apology = Apology.new(body: 'lorem ipsum')
      expect(apology.save).to eq(false)
    end

    it 'requires contents in the body field' do
      apology = Apology.new(image: 'image.jpg')
      expect(apology.save).to eq(false)
    end

    it "permits up to #{character_max} characters in the body field" do
      apology = Apology.new(image: 'image.jpg')

      apology.body = string_at_char_max
      expect(apology.save).to eq(true)

      apology.body = string_over_char_max
      expect(apology.save).to eq(false)
    end
  end

  it 'orders apologies by descending created_at' do
    apology1 = Apology.create!(image: 'image.jpg', body: 'first apology')
    apology2 = Apology.create!(image: 'image.jpg', body: 'second apology')
    expect(Apology.ordered).to eq([apology2, apology1])
  end

end
