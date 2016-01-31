module PetBuilder
  class Opener
    FileNameMissing     = Class.new(StandardError)
    NotSupportedFormat  = Class.new(StandardError)

    class << self
      def call(data)
        raise FileNameMissing.new(data) unless data.respond_to?(:file_name)

        if end_with?(data, '.ssv')
          Openers::SSV.build(data)
        elsif end_with?(data, '.csv')
          Openers::CSV.build(data)
        else
          raise NotSupportedFormat.new(data)
        end
      end

      private

      def end_with?(data, string)
        data.file_name.end_with?(string)
      end
    end
  end
end