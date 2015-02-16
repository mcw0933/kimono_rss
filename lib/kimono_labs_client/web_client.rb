module KimonoLabsClient
  # Web client for fetching a json endpoint's content via http.
  class WebClient
    attr_reader :api_key

    # initializer - named params are required and throw ArgumentError automatically
    # https://robots.thoughtbot.com/ruby-2-keyword-arguments
    def initialize(api_key:)
      @api_key = api_key
      @http = http
    end

    # Lists available web endpoints for the kimono api key.
    # url format: https://www.kimonolabs.com/kimonoapis?apikey={api_key}
    # docs: https://www.kimonolabs.com/apidocs#ListApis
    def list
      response = @http.get uri('/kimonoapis', apikey: api_key)
      response.body
    end

    private

    def http
      Faraday.new(url: uri) do |http|
        http.request :url_encoded             # form-encode POST params
        http.response :logger                 # log requests to STDOUT
        http.adapter Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def uri(path = '', query_hash = {})
      uri = URI('https://www.kimonolabs.com')
      uri.path = path
      uri.query = Hash(query_hash).to_query

      uri
    end
  end
end
