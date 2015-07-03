module EatabitRails

  class Printer

    PATH = 'printers'

    attr_reader :printer

    def initialize(attributes)
      @name             = attributes['name']
      @enabled          = attributes['enabled']
      @pickup_minutes   = attributes['pickup_minutes']
      @delivery_minutes = attributes['delivery_minutes']
      @state            = attributes['state']
      @online           = attributes['online']
      @has_paper        = attributes['has_paper']
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
