# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EatabitRails::Account do
  describe 'existance' do
    it 'should exist' do
      expect(EatabitRails::Account).to be
    end
  end

  context 'v4', version: :v4 do
    describe '.find' do
      let(:account) { find_account }

      it 'should return a EatabitRails::Account' do
        expect(account).to be_a(EatabitRails::Account)
      end

      it 'should assign attributes' do
        expect(account.name).to eq('eatabit.io')
        expect(account.environment).to eq('development')
        expect(account.enabled).to be
        expect(account.created_at).to be
      end
    end
  end

  def find_account
    VCR.use_cassette('v4/account') do
      EatabitRails::Account.find
    end
  end
end
