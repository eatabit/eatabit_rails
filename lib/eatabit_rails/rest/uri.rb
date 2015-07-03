module EatabitRails

  module REST

    class Uri

      def self.default_params
        {
          content_type: :json,
          accept: :json
        }
      end

      def initialize
        @sid      = EatabitRails.configuration.sid
        @token    = EatabitRails.configuration.token
        @protocol = EatabitRails::REST::Config::PROTOCOL
        @host     = EatabitRails::REST::Config::HOST
        @version  = EatabitRails.configuration.version || EatabitRails::REST::Config::VERSION
      end

      def printer(id)
        [
          base_uri,
          EatabitRails::Printer::PATH,
          id
        ].join('/')
      end

      def base_uri
        [
          @protocol,
          '://',
          @sid,
          ':',
          @token,
          '@',
          @host,
          '/',
          @version,
          '/account/',
          @sid
        ].join
      end

      alias :account :base_uri
    end
  end
end
