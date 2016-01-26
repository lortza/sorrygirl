class Apology < ActiveRecord::Base

  IMAGES = ["ryan-gosling01.jpg", "ryan-gosling02.jpg", "ryan-gosling03.jpg", "ryan-gosling04.jpg", "ryan-gosling05.jpg", "ryan-gosling06.png", "ryan-gosling07.jpg", "ryan-gosling08.jpg", "ryan-gosling09.jpg", "ryan-gosling10.jpg"]

  before_save :generate_image

  validates :body, presence: true, length: { maximum: 200}


  def generate_image
    self.image = IMAGES.sample
  end #generate_image

end #Apology
