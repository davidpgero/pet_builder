require 'spec_helper'

describe PetBuilder::Openers::Template do
  let(:object_with_file_name) { Struct.new(:file_name)}
  let(:separator) { '#' }

  describe '.separator' do
    context 'when separator is missing' do
      it{ expect { described_class.separator }.to raise_error NotImplementedError }
    end

    context "when separator is set to '#'" do
      it do
        allow(described_class).to receive(:separator).and_return(separator)
        expect(described_class.separator).to eq separator
      end
    end
  end
end