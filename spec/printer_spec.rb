require 'spec_helper'

RSpec.describe EatabitRails::Printer do

  describe 'existance' do

    it 'should exist' do
      expect(EatabitRails::Printer).to be
    end
  end

  describe '.find' do

    before { initialize_application }

    it 'should return a Printer' do
      VCR.use_cassette('printer') do
        printer = EatabitRails::Printer.find 'fc4a764b-4822-45d5-b91f-bc808412002f'
      end
    end
  end

  def initialize_application
    EatabitRails.configure do |config|
      config.sid    = '617117b5-4042-4951-b75c-88f2ee159afd'
      config.token  = 'c7ae2067-95bd-4722-909a-9307ce019097'
    end
  end
end
