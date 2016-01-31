module PetBuilder
  module Openers
    class CSV < Template
      class << self
        def separator
          ','.freeze
        end
      end
    end

  end
end