module PetBuilder
  class Pet
    attr_reader :name, :age, :pet
    def initialize(data)
      @name = data[:name]
      @age = data[:age]
      @pet = data[:pet]
    end

    def to_s
      "#{name} is #{age} years old and has a #{pet}"
    end
  end
end