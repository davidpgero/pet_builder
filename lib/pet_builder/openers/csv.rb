module PetBuilder
  module Openers
    class CSV < Template
      class << self

        # @return [String]
        def separator
          ','.freeze
        end
      end
    end

  end
end