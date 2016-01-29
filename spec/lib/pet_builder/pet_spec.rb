require 'spec_helper'

describe PetBuilder::Pet do
  let(:init_data){ {name: 'John', age: 12, pat: 'dog'} }

  describe '.new' do
    it{ expect( described_class.new init_data ).not_to be_nil }
    it{ expect( described_class.new({}) ).not_to be_nil }
  end

  describe '#error_policy' do
    let(:pet_error){PetError = Class.new(StandardError)}
    let(:error_policy) do
      Proc.new{ |error_data| raise pet_error.new(error_data) }
    end

    it do
      expect{
        described_class.new( {error_policy: error_policy} )
      }.to raise_error(pet_error)
    end
  end
end