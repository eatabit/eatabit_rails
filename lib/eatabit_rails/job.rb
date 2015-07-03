module EatabitRails

  class Job

    attr_reader :id,
                :body,
                :state,
                :environment,
                :pickup_minutes,
                :delivery_minutes,
                :status_url,
                :status_url_method,
                :created_at

    def initialize(attributes)
      @id                 = attributes['id']
      @body               = attributes['body']
      @state              = attributes['state']
      @environment        = attributes['environment']
      @pickup_minutes     = attributes['pickup_minutes']
      @delivery_minutes   = attributes['delivery_minutes']
      @status_url         = attributes['status_url']
      @status_url_method  = attributes['status_url_method']
      @created_at         = attributes['created_at']
    end

    def self.find(id, printer_id)
      job_uri     = EatabitRails::REST::Uri.new.job id, printer_id
      params      = EatabitRails::REST::Uri.default_params
      response    = RestClient.get job_uri, params
      attributes  = JSON.parse(response.body)['job']

      new(attributes)
    end
  end
end
