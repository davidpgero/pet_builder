require 'spec_helper'

describe PetBuilder::Openers::Template do
  let(:struct_file_name) { Struct.new(:file_name)}
  let(:struct_file_and_presenter) { Struct.new(:file_name, :presenter) }
  let(:separator) { '#' }
  let(:presenter){ PetBuilder::Pet }

  let(:sample_filename) { 'sample_csv' }
  let(:with_file_path) { struct_file_name.new(sample_filename) }
  let(:with_file_and_presenter) { struct_file_and_presenter.new(sample_filename, presenter) }
  let(:with_wrong_file_path) { struct_file_name.new('missing_file.csv') }
  let(:with_wrong_presenter) { struct_file_and_presenter.new(sample_filename, '') }

  let(:mock_file_options) { {:universal_newline=>false, :headers=>true, :header_converters=>:symbol, :col_sep=>','} }
  let(:file_not_found_error) { PetBuilder::Openers::Template::FileNotFound }
  let(:presenter_init_error) { PetBuilder::Openers::Presenter::PresenterInitializeError }
  let(:presenter_missing_error) { PetBuilder::Openers::Presenter::MissingPresenter }
  let(:csv_sample_content) { "name,age,pet\nPeter,25,dog" }

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

  describe '.build' do
    before(:all) do
      class TemplateTester < PetBuilder::Openers::Template
        def self.separator; ','; end
      end
    end

    context 'when file not found' do
      it { expect { TemplateTester.build(with_wrong_file_path) }.to raise_error file_not_found_error }
    end

    context 'when presenter missing' do
      it do
        allow(File).to receive(:open).with(sample_filename, mock_file_options).and_return(csv_sample_content)
        expect { TemplateTester.build(with_file_path) }.to raise_error presenter_missing_error
      end
    end

    context 'when presenter is wrong' do
      it do
        allow(File).to receive(:open).with(sample_filename, mock_file_options).and_return(csv_sample_content)
        expect { TemplateTester.build(with_wrong_presenter) }.to raise_error presenter_init_error
      end
    end

    context 'when file and presenter is well' do
      it do
        allow(File).to receive(:open).with(sample_filename, mock_file_options).and_return(csv_sample_content)
        expect(TemplateTester.build(with_file_and_presenter)).not_to be_nil
        expect(TemplateTester.build(with_file_and_presenter).size).to eq 1
        expect(TemplateTester.build(with_file_and_presenter)).to be_a Array
      end
    end
  end
end