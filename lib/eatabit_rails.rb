require 'rest-client'

require 'eatabit_rails/version'
require 'eatabit_rails/util/configuration'
require 'eatabit_rails/rest/config'
require 'eatabit_rails/rest/uri'
require 'eatabit_rails/printer'
require 'eatabit_rails/account'

module EatabitRails

  def self.configure(&block)
    yield configuration
  end

  def self.configuration
    @configuration ||= Util::Configuration.new
  end
end
