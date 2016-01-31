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
  end
end