require 'spec_helper'

describe PetBuilder::Pets do
  describe '.new' do
    it { expect(described_class.new('file_name', 'presenter')).not_to be_nil }
  end

  describe 'has readers' do
    let(:file_name) { 'file_name' }
    let(:presenter) { 'presenter' }
    subject { described_class.new(file_name, presenter) }

    it { expect(subject.file_name).to eq file_name }
    it { expect(subject.presenter).to eq presenter }
  end
end