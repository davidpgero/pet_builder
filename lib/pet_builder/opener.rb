module PetBuilder
  class Opener
    class << self
      def call(data)
        if data.file_name.end_with?('.ssv')
          SSV.build(data)
        else
          CSV.build(data)
        end
      end
    end
  end
end