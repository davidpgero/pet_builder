module PetBuilder
  module Openers
    class SSV < Template
      class << self
        def separator
          ';'.freeze
        end
      end
    end
  end
end
