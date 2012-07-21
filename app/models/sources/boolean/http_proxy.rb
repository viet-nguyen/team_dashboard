require 'open-uri'

module Sources
  module Boolean
    class HttpProxy < Sources::Boolean::Base
      def get(options = {})
        uri = URI.parse(options.fetch(:http_proxy_url))
        Rails.logger.debug("Requesting from #{uri} ...")
        JSON.parse(uri.read)
      rescue JSON::ParserError => e
        Rails.logger.error "Error while parsing JSON response: #{e}"
        nil
      end
    end
  end
end