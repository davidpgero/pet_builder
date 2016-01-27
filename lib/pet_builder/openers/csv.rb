module PetBuilder
  module Openers
    class CSV < Template
      class << self
        def separator
          ','
        end
      end
    end

  end
end