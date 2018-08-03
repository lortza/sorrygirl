class Apology < ActiveRecord::Base

  before_create :assign_image

  validates :body, presence: true, length: { maximum: 170 }
  validates :image, presence: true

  scope :ordered, -> { all.order("created_at DESC") }

  def assign_image
    self.image = Image.select
  end

end
