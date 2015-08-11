require 'spec_helper'

RSpec.describe EatabitRails::Job do

  describe 'existance' do

    it 'should exist' do
      expect(EatabitRails::Job).to be
    end
  end

  context 'v4', version: :v4 do

    describe '.create' do

      let(:job) { create_job }

      it 'should return a EatabitRails::Job' do
        expect(job).to be_a(EatabitRails::Job)
      end

      it 'should assign attributes' do
        expect(job.id).to eq(30751)
        expect(job.external_id).to eq('1024-768#ALPHA')
        expect(job.state).to eq('queued')
        expect(job.body).to eq('One large pepperoni pizza')
        expect(job.status_url).to eq('https://api.mysite.com/orders/1024768.json')
        expect(job.status_url_method).to eq('PUT')
        expect(job.environment).to eq('development')
        expect(job.fulfill_at).to be
        expect(job.created_at).to be
        expect(job.account).to eq({ 'sid' => '617117b5-4042-4951-b75c-88f2ee159afd' })
        expect(job.printer).to eq({ 'fulfillment' => 5, 'id' => 'fc4a764b-4822-45d5-b91f-bc808412002f' })
      end
    end

    describe '.find' do

      let(:job) { find_job }

      it 'should return a EatabitRails::Job' do
        expect(job).to be_a(EatabitRails::Job)
      end

      it 'should assign attributes' do
        expect(job.id).to eq(30751)
        expect(job.external_id).to eq('1024-768#ALPHA')
        expect(job.state).to eq('queued')
        expect(job.body).to eq('One large pepperoni pizza')
        expect(job.status_url).to eq('https://api.mysite.com/orders/1024768.json')
        expect(job.status_url_method).to eq('PUT')
        expect(job.environment).to eq('development')
        expect(job.fulfill_at).to be
        expect(job.created_at).to be
        expect(job.account).to eq({ 'sid' => '617117b5-4042-4951-b75c-88f2ee159afd' })
        expect(job.printer).to eq({ 'fulfillment' => 5, 'id' => 'fc4a764b-4822-45d5-b91f-bc808412002f' })
      end
    end

    def job_attributes
      {
        id: '1024-768#ALPHA',
        body: 'One large pepperoni pizza',
        status_url: 'https://api.mysite.com/orders/1024768.json',
        status_url_method: 'PUT'
      }
    end

    def create_job
      VCR.use_cassette('v4/job_create') do
        EatabitRails::Job.create 'fc4a764b-4822-45d5-b91f-bc808412002f', job_attributes
      end
    end

    def find_job
      VCR.use_cassette('v4/job') do
        EatabitRails::Job.find 'fc4a764b-4822-45d5-b91f-bc808412002f', '30751'
      end
    end
  end
end
