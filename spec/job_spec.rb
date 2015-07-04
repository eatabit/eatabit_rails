require 'spec_helper'

RSpec.describe EatabitRails::Job do

  describe 'existance' do

    it 'should exist' do
      expect(EatabitRails::Job).to be
    end
  end

  context 'v2', version: :v2 do

    describe '.create' do

      let(:job) { create_job }

      it 'should return a EatabitRails::Job' do
        expect(job).to be_a(EatabitRails::Job)
      end

      it 'should assign attributes' do
        expect(job.id).to eq(25311)
        expect(job.body).to eq('One large pepperoni pizza')
        expect(job.state).to eq('queued')
        expect(job.environment).to eq('development')
        expect(job.pickup_minutes).to eq(15)
        expect(job.delivery_minutes).to eq(30)
        expect(job.status_url).to eq('https://api.mysite.com/orders/1024768.json')
        expect(job.status_url_method).to eq('PUT')
        expect(job.created_at).to be
      end
    end

    describe '.find' do

      let(:job) { find_job }

      it 'should return a EatabitRails::Job' do
        expect(job).to be_a(EatabitRails::Job)
      end

      it 'should assign attributes' do
        expect(job.id).to eq(9696)
        expect(job.body).to eq('One large pepperoni pizza with breadsticks')
        expect(job.state).to eq('expired')
        expect(job.environment).to eq('development')
        expect(job.pickup_minutes).to eq(15)
        expect(job.delivery_minutes).to eq(30)
        expect(job.status_url).to eq('https://api.mysite.com/orders/1024768.json')
        expect(job.status_url_method).to eq('PUT')
        expect(job.created_at).to be
      end
    end

    def job_attributes
      {
        body: 'One large pepperoni pizza',
        status_url: 'https://api.mysite.com/orders/1024768.json',
        status_url_method: 'PUT'
      }
    end

    def create_job
      VCR.use_cassette('job_create') do
        EatabitRails::Job.create 'fc4a764b-4822-45d5-b91f-bc808412002f', job_attributes
      end
    end

    def find_job
      VCR.use_cassette('job') do
        EatabitRails::Job.find 'fc4a764b-4822-45d5-b91f-bc808412002f', '9696'
      end
    end
  end
end
