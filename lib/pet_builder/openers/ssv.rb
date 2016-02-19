module PetBuilder
  module Openers
    class SSV < Template
      class << self

        # @return [String]
        def separator
          ';'.freeze
        end
      end
    end
  end
end
