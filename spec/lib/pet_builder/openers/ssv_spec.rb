require 'spec_helper'

describe PetBuilder::Openers::SSV do
  let(:separator) { ';' }

  describe '.separator' do
    it { expect(described_class.separator).to eq separator }
  end
end