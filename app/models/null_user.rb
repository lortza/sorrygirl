# frozen_string_literal: true

class NullUser
  def authenticate(_)
    false
  end

  def username
    'guest'
  end
end
