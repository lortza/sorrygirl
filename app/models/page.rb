class Page < ActiveRecord::Base

  before_validation :generate_slug

  validates :name, :body, presence: true
  validates :slug, uniqueness: { case_sensitive: false }


  def generate_slug
    self.slug = name.downcase 
    self.slug ||= name.parameterize if name
  end #generate_slug

  def to_param
    slug
  end #to_param
end #Page
