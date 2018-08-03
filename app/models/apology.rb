class Apology < ActiveRecord::Base

  before_create :assign_image
  CHARACTER_MAX = 170

  validates :body, presence: true, length: { maximum: CHARACTER_MAX }
  validates :image, presence: true

  scope :ordered, -> { all.order("created_at DESC") }

  def character_max
    CHARACTER_MAX
  end

  def assign_image
    self.image = Image.select
  end

end
