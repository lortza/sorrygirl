# frozen_string_literal: true

class GuaranteedUser
  class << self
    def find_by(parms)
      User.find_by(parms) || NullUser.new
    end
  end
end
