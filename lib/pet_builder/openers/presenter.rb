module PetBuilder
  module Openers
    class Presenter
      MissingPresenter          = Class.new(StandardError)
      PresenterInitializeError  = Class.new(StandardError)

      # @param[#presenter]: Presenter
      # @raise MissingPresenter
      # @return[#build]
      def initialize(data)
        raise MissingPresenter.new(data) unless data.respond_to?(:presenter)
        @presenter = data.presenter
      end

      # @param[#to_s]
      def build(row)
        presenter.new(row)
        rescue NoMethodError => e
          raise PresenterInitializeError.new(e.message)
      end

      private
      attr_reader :presenter
    end
  end
end
