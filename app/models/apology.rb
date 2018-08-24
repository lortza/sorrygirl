class Apology < ActiveRecord::Base
# frozen_string_literal: true

  CHARACTER_MAX = 170

  before_validation :assign_image, on: :create

  validates :body, presence: true, length: { maximum: CHARACTER_MAX }
  validates :image, presence: true

  scope :ordered, -> { all.order("created_at DESC") }

  def character_max
    CHARACTER_MAX
  end

  def assign_image
    self.image = Image.sample
  end

end
