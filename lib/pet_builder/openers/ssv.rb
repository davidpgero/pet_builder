module PetBuilder
  module Openers
    class SSV < Template
      class << self
        def separator
          ';'
        end
      end
    end
  end
end
