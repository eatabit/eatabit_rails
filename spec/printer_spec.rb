require 'spec_helper'

RSpec.describe EatabitRails::Printer do

  describe 'existance' do

    it 'should exist' do
      expect(EatabitRails::Printer).to be
    end
  end

  context 'v2', version: :v2 do

    describe '.find' do

      let(:printer) { find_printer }

      it 'should return a EatabitRails::Printer' do
        expect(printer).to be_a(EatabitRails::Printer)
      end

      it 'should assign attributes' do
        expect(printer.name).to eq('Eatabit.io Pizza')
        expect(printer.enabled).to be
        expect(printer.pickup_minutes).to eq(15)
        expect(printer.delivery_minutes).to eq(30)
        expect(printer.state).to eq('unavailable')
        expect(printer.online).to_not be
        expect(printer.has_paper).to be
      end
    end

    def find_printer
      VCR.use_cassette('printer') do
        EatabitRails::Printer.find 'fc4a764b-4822-45d5-b91f-bc808412002f'
      end
    end
  end
end
