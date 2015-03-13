# Describes the JSON schema for a KimonoLabs endpoint as a series of effective, versioned structures.
class Feed < ActiveRecord::Base
  belongs_to :endpoint, inverse_of: :feeds
end
