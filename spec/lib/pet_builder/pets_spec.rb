require 'spec_helper'

describe PetBuilder::Pets do
  let(:file_name) { 'file_name' }
  let(:presenter) { 'presenter' }
  let(:return_data)    { [] }

  describe '.new' do
    subject { described_class.new(file_name, presenter) }
    it { expect(subject.file_name).to eq file_name }
    it { expect(subject.presenter).to eq presenter }
  end

  describe '#execute' do
    subject { described_class.new(file_name, presenter) }
    it do
      allow(PetBuilder::Opener).to receive(:call).with(subject).and_return(return_data)
      expect(subject.execute).to eq return_data
    end
  end
end