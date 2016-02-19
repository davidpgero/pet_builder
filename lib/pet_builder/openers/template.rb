module PetBuilder
  module Openers
    class Template
      FileNotFound = Class.new(StandardError)

      class << self

        # @param[#file_name]
        # @return[Array]
        def build(data)
          res = []
          ::CSV.foreach(data.file_name,
                        headers: true,
                        header_converters: :symbol,
                        col_sep: separator) do |row|
            res << init_new_presenter(data, row)
          end
          res
        rescue Errno::ENOENT => e
          raise FileNotFound.new(e.message)
        end

        def separator
          raise NotImplementedError
        end

        private
        def init_new_presenter( data, row )
          Openers::Presenter.new(data).build(row)
        end
      end
    end
  end
end