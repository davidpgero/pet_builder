module PetBuilder
  module Openers
    class Template
      class << self
        def build(data)
          res = []
          ::CSV.foreach(data.file_name,
                        headers: true,
                        header_converters: :symbol,
                        col_sep: separator) do |row|
            res << data.presenter.new(row)
          end
          res
        end

        def separator
          raise NotImplementedError
        end
      end
    end
  end
end