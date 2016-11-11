RSpec.configure do |config|

  config.before :each, version: :v4 do
    EatabitRails.configure do |config|
      config.sid      = '617117b5-4042-4951-b75c-88f2ee159afd'
      config.token    = 'c7ae2067-95bd-4722-909a-9307ce019097'
      config.version  = 'v4'
    end
  end

  config.before :each, version: :v5 do
    EatabitRails.configure do |config|
      config.sid      = '617117b5-4042-4951-b75c-88f2ee159afd'
      config.token    = 'c7ae2067-95bd-4722-909a-9307ce019097'
      config.version  = 'v5'
    end
  end
end

