# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EatabitRails::Printer do
  describe 'existance' do
    it 'should exist' do
      expect(EatabitRails::Printer).to be
    end
  end

  context 'v5', version: :v5 do
    describe '.find' do
      let(:printer) { find_printer }

      it 'should return a EatabitRails::Printer' do
        expect(printer).to be_a(EatabitRails::Printer)
      end

      it 'should assign attributes' do
        expect(printer.id).to eq('FC4A764B-4822-45D5-B91F-BC808412002F')
        expect(printer.name).to eq('Eatabit.io Pizza')
        expect(printer.enabled).to eq(true)
        expect(printer.state).to eq('unavailable')
        expect(printer.online).to eq(false)
        expect(printer.paper).to eq(true)
        expect(printer.fulfillment).to eq(5)
        expect(printer.autoprint).to eq(false)
        expect(printer.sound).to eq(1)
        expect(printer.light).to eq(1)
      end
    end

    describe '.update' do
      let(:attributes) { { autoprint: true, sound: 0, light: 1 } }
      let(:printer) { update_printer }

      it 'should return a EatabitRails::Printer' do
        expect(printer).to be_a(EatabitRails::Printer)
      end

      it 'should update the printers attributes' do
        expect(printer.autoprint).to(
          eq(true)
        )
        expect(printer.sound).to(
          eq(0)
        )
        expect(printer.light).to(
          eq(1)
        )
      end
    end
  end

  def find_printer
    VCR.use_cassette('v5/printer/list') do
      EatabitRails::Printer.find('fc4a764b-4822-45d5-b91f-bc808412002f')
    end
  end

  def update_printer
    VCR.use_cassette('v5/printer/update') do
      EatabitRails::Printer.update(
        'beb3a92a-17a6-4bf6-a3f0-41712ccf49b5',
        attributes
      )
    end
  end
end
