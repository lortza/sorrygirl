class Apology < ActiveRecord::Base

  before_save :generate_image

  validates :body, presence: true, length: { maximum: 210}

  scope :ordered, -> { all.order("created_at DESC") }

  def generate_image
    self.image = Image.select
  end

end
