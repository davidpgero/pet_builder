module PetBuilder
  class Pets
    attr_reader :file_name, :presenter
    def initialize(file_name, presenter)
      @file_name = file_name
      @presenter = presenter
    end

    def execute
      Opener.call(self)
    end

    class << self

      # @param file_name [String]: File name
      def build(file_name)
        new(file_name, PetBuilder::Pet).execute
      end
    end
  end
end