module KimonoLabsClient
  # Poller for checking and updating feed content.
  class Poller
    attr_reader :api_key

    def initialize(api_key:, feed:)
      @api_key = api_key
      @feed = feed
    end

    # Checks the current content of the endpoint, and updates it if new
    def poll
      current = WebClient.new(api_key: @api_key).get(@feed.api_id)
      if Utils.diff(@feed.latest, current)
        Entry.new(feed_id: @feed.id, content: current).save!
      end

      @feed.latest
    end
  end
end
