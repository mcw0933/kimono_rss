module KimonoLabsClient
  # Web client for fetching a json endpoint's content via http.
  class WebClient
    attr_reader :api_key

    # initializer
    def initialize(api_key)
      fail 'API key must be provided!' if api_key.nil?

      @api_key = api_key
    end

    # Lists available web endpoints for a kimono api key.
    # url format: https://www.kimonolabs.com/kimonoapis?apikey={api_key}
    # docs: https://www.kimonolabs.com/apidocs#ListApis
    def list
    end

    # Gets a json document from the specified url and kimono api key.
    def get(_url)
    end
  end
end
