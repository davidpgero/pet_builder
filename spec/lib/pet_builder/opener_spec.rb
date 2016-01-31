require 'spec_helper'

describe PetBuilder::Opener do
  describe '.call' do
    let(:struct_file_name) { Struct.new(:file_name)}
    let(:csv_file) { struct_file_name.new('csv.csv') }
    let(:ssv_file) { struct_file_name.new('ssv.ssv') }
    let(:wrong_extension) { struct_file_name.new('wrong.extension') }

    context 'when filename is missed' do
      it { expect { described_class.call( {} ) }.to raise_error PetBuilder::Opener::FileNameMissing }
    end

    context 'when file format is unknown' do
      it { expect { described_class.call(wrong_extension) }.to raise_error PetBuilder::Opener::NotSupportedFormat }
    end

    context 'when file format is CSV' do
      it do
        allow(PetBuilder::Openers::CSV).to receive(:build).and_return([])
        expect(described_class.call(csv_file)).to eq []
      end
    end

    context 'when file format is SSV' do
      it do
        allow(PetBuilder::Openers::SSV).to receive(:build).and_return([])
        expect(described_class.call(ssv_file)).to eq []
      end
    end
  end
end