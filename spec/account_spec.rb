require 'spec_helper'

RSpec.describe EatabitRails::Account do

  describe 'existance' do

    it 'should exist' do
      expect(EatabitRails::Account).to be
    end
  end

  context 'v2', version: :v2 do

    describe '.find' do

      let(:account) { find_account('v2') }

      it 'should return a EatabitRails::Account' do
        expect(account).to be_a(EatabitRails::Account)
      end

      it 'should assign attributes' do
        expect(account.name).to eq('eatabit.io Test')
        expect(account.environment).to eq('development')
        expect(account.enabled).to be
        expect(account.created_at).to be
      end
    end
  end

  context 'v4', version: :v4 do

    describe '.find' do

      let(:account) { find_account('v4') }

      it 'should return a EatabitRails::Account' do
        expect(account).to be_a(EatabitRails::Account)
      end

      it 'should assign attributes' do
        expect(account.name).to eq('eatabit.io Test')
        expect(account.environment).to eq('development')
        expect(account.enabled).to be
        expect(account.created_at).to be
      end
    end
  end

  def find_account(version)
    VCR.use_cassette("account_#{version}") do
      EatabitRails::Account.find
    end
  end
end
