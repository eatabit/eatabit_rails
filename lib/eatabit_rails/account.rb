module EatabitRails
  class Account

    attr_reader :name,
                :environment,
                :enabled,
                :created_at

    def initialize(attributes)
      @name         = attributes['name']
      @environment  = attributes['environment']
      @enabled      = attributes['enabled']
      @created_at   = attributes['created_at']
    end

    def self.find
      account_uri = EatabitRails::REST::Uri.new.account
      params      = EatabitRails::REST::Uri.default_params
      response    = RestClient.get account_uri, params
      attributes  = JSON.parse(response.body)['account']

      new(attributes)
    end
  end
end
