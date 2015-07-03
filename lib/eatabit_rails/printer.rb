module EatabitRails

  class Printer

    PATH = 'printers'

    def self.find(id)
      printer_uri = EatabitRails::REST::Uri.new.printer id
      params      = EatabitRails::REST::Uri.default_params
      response    = RestClient.get printer_uri, params

      JSON.parse response.body
    end
  end
end
