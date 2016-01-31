require 'spec_helper'

describe PetBuilder::Openers::Presenter do
  let(:presenter_init_error) { PetBuilder::Openers::Presenter::PresenterInitializeError }
  let(:presenter_missing_error) { PetBuilder::Openers::Presenter::MissingPresenter }
  let(:presenter) { Struct.new(:presenter) }
  let(:wrong_presenter) { presenter.new('') }
  let(:good_presenter) { presenter.new(Array) }
  let(:build_data) { [1,2,4] }


  describe '.new' do
    context 'when presenter missing' do
      it { expect { described_class.new( {} ) }.to raise_error presenter_missing_error }
    end

    context 'when presenter is wrong' do
      it { expect(described_class.new(wrong_presenter)).not_to be_nil }
    end
  end

  describe '#build' do
    context 'when presenter is wrong' do
      it { expect { described_class.new(wrong_presenter).build(build_data) }.to raise_error presenter_init_error }
    end

    context 'when presenter is good' do
      it { expect(described_class.new(good_presenter).build(build_data)).to eq build_data}
    end
  end

  # let(:init_data) { { name: 'John', age: 12, pat: 'dog' } }
  #
  # describe '.new' do
  #   it { expect(described_class.new(init_data)).not_to be_nil }
  #   it { expect(described_class.new({})).not_to be_nil }
  # end
  #
  # describe '#error_policy' do
  #   let(:pet_error) { PetError = Class.new(StandardError) }
  #   let(:error_policy) do
  #     Proc.new { |error_data| raise pet_error.new(error_data) }
  #   end
  #
  #   it do
  #     expect do
  #       described_class.new(error_policy: error_policy)
  #     end.to raise_error(pet_error)
  #   end
  # end
end