module PetBuilder
  class Pet
    attr_reader :name, :age, :pet
    def initialize(data)
      @error_policy = data.fetch(:error_policy) { Proc.new { nil } }
      @name = data.fetch(:name) { error_policy.call [:name, data] }
      @age  = data.fetch(:age) { error_policy.call [:age, data] }
      @pet  = data.fetch(:pet) { error_policy.call [:pet, data] }
    end

    def to_s
      "#{name} is #{age} years old and has a #{pet}"
    end

    private

    attr_reader :error_policy
  end
end
