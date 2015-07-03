require 'spec_helper'

RSpec.describe EatabitRails::Printer do

  describe 'existance' do

    it 'should exist' do
      expect(EatabitRails::Printer).to be
    end
  end

  describe '.find' do

    let(:printer) { find_printer }

    it 'should return a EatabitRails::Printer' do
      expect(printer).to be_a(EatabitRails::Printer)
    end
  end

  def find_printer
    VCR.use_cassette('printer') do
      EatabitRails::Printer.find 'fc4a764b-4822-45d5-b91f-bc808412002f'
    end
  end
end
