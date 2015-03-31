# Describes the JSON schema for a KimonoLabs endpoint as a series of effective, versioned structures.
class Feed < ActiveRecord::Base
  belongs_to :endpoint, inverse_of: :feeds
  has_many :entries, inverse_of: :feed

  def latest
    entries.try(:last).try(:content)
  end

  def api_id
    endpoint.kimono_id
  end
end
