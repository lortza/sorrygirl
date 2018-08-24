# frozen_string_literal: true

class Page < ApplicationRecord
  before_validation :generate_slug

  validates :name, presence: true
  validates :body, presence: true, length: { maximum: 210}

  validates :slug, uniqueness: { case_sensitive: false }

  PUBLISH_STATUS = %w[Published Unpublished].freeze
  validates :publish_status, inclusion: { in: PUBLISH_STATUS }

  scope :published, -> { where(:publish_status => 'Published').order("name") }


  def generate_slug
    self.slug = name.downcase
    self.slug ||= name.parameterize if name
  end #generate_slug

  def to_param
    slug
  end #to_param
end #Page
