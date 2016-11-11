module EatabitRails
  class Printer

    attr_reader :id,
                :name,
                :enabled,
                :pickup_minutes,
                :delivery_minutes,
                :state,
                :online,
                :paper,
                :fulfillment,
                :sound,
                :light,
                :autoprint

    def initialize(attributes)
      @id               = attributes['id']
      @name             = attributes['name']
      @enabled          = attributes['enabled']
      @pickup_minutes   = attributes['pickup_minutes']
      @delivery_minutes = attributes['delivery_minutes']
      @state            = attributes['state']
      @online           = attributes['online']
      @paper            = attributes['paper']
      @fulfillment      = attributes['fulfillment']
      @sound            = attributes['sound']
      @light            = attributes['light']
      @autoprint        = attributes['autoprint']
    end

    def self.find(id)
      printer_uri = EatabitRails::REST::Uri.new.printer id
      params      = EatabitRails::REST::Uri.default_params
      response    = RestClient.get printer_uri, params
      attributes  = JSON.parse(response.body)['printer']

      new(attributes)
    end
  end
end
